require 'httparty'

class HttpHunt
  attr_accessor :output
  USER_ID = '8Bw9ryvH'.freeze
  HOST = "https://http-hunt.thoughtworks-labs.net".freeze
  INPUT_ROUTE = '/challenge/input'.freeze
  OUTPUT_ROUTE = '/challenge/output'.freeze
  CONTENT_TYPE = 'application/json'.freeze

  def initialize
    @output = 'idial'
  end

  def calculate_size
    headers = { "userId"  => USER_ID, "content-type" => CONTENT_TYPE }
    @output = HTTParty.get(HOST + INPUT_ROUTE, headers: headers)
    if @output.has_key?('text')
      paragraph = @output['text']
      total_characters = paragraph.size
      @output = HTTParty.post(HOST+OUTPUT_ROUTE, query: { "count": total_characters }, headers: headers)
    end
  end
end