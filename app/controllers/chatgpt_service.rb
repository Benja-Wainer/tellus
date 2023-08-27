class ChatgptService
  include HTTParty

  attr_reader :api_url, :options, :model, :message

  def initialize(message, model = 'gpt-3.5-turbo')
    api_key = ENV['CHAT_GPT_API_KEY']
    @options = {
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{api_key}"
      }
    }
    @api_url = 'https://api.openai.com/v1/chat/completions'
    @model = model
    @message = message
  end

  def call
    body = {
      model:,
      messages:  [
        {
          "role": "system",
          "content": "You will be provided with a block of text, and your task is to extract a list of maximum 5 topics from it. The topics must be general and 5 words or less."
        },
        {
          "role": "user",
          "content": message }
        ],
        "temperature": 0.5,
        "max_tokens": 100,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
    }
    response = HTTParty.post(api_url, body: body.to_json, headers: options[:headers], timeout: 10)
    raise response['error']['message'] unless response.code == 200

    response['choices'][0]['message']['content'].split("\n").map! {|topic| topic.gsub(/\d. /, "")}
  end

  class << self
    def call(message, model = 'gpt-3.5-turbo')
      new(message, model).call
    end
  end
end
