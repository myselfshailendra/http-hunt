require 'httparty'

class HttpHunt
  attr_accessor :response
  HEADERS = { "userId"  => '8Bw9ryvH', "content-type" => 'application/json' }.freeze
  HOST = "https://http-hunt.thoughtworks-labs.net".freeze
  INPUT_ROUTE = '/challenge/input'.freeze
  OUTPUT_ROUTE = '/challenge/output'.freeze

  def initialize
    @response = 'idial'
  end

  def calculate_size
    @response = receive_string
    return unless @response.has_key?('text')
    total_characters = @response['text'].size
    @response = send_result(total_characters)
  end

  def receive_string
    HTTParty.get(HOST + INPUT_ROUTE, headers: HEADERS)
  end

  def send_result(total_characters)
    HTTParty.post(HOST + OUTPUT_ROUTE, query: { "count": total_characters }, headers: HEADERS)
  end
end