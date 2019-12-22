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

  def calculate_characters
    @response = receive_string
    return unless @response.has_key?('text')
    total_characters = @response['text'].length
    @response = send_result( { "count": total_characters } )
  end

  def calculate_words
    @response = receive_string
    return unless @response.has_key?('text')
    total_words = @response['text'].split(' ').size
    @response = send_result( { "wordCount": total_words } )
  end

  def calculate_sentences
    @response = receive_string
    return unless @response.has_key?('text')
    total_sentences = @response['text'].split(/[.?]+[ ]/).size
    @response = send_result( { "sentenceCount": total_sentences } )
  end

  def receive_string
    HTTParty.get(HOST + INPUT_ROUTE, headers: HEADERS)
  end

  def send_result(query)
    HTTParty.post(HOST + OUTPUT_ROUTE, query: query, headers: HEADERS)
  end
end