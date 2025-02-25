require 'httparty'
require 'dotenv'
require_relative "recipient"

Dotenv.load
CHANNEL_URL = "https://slack.com/api/conversations.list"

module Slack
  
  class Channel < Recipient
    
    attr_reader :id, :name, :topic, :member_count
    
    def initialize(id: , name: , topic: , member_count: )
      super(id: id, name: name)
      @topic = topic
      @member_count = member_count      
    end
    
    def self.list
      query = {token: ENV["SLACK_TOKEN"]}
      response = self.get(CHANNEL_URL, query)
      
      list_of_channels = response['channels'].map do |channel|
        self.new(id: channel['id'], name: channel['name'], topic: channel['topic'], member_count: channel['num_members'])
      end
      
      return list_of_channels
    end
    
    def details
      channel_details = {
      id: @id,
      name: @name,
      topic: @topic,
      member_count: @member_count}
      return channel_details
    end
    
  end
  
end