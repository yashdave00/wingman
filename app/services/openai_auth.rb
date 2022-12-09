require "openai"

class OpenaiAuth

    def self.fetch_client
        openai_client = OpenAI::Client.new(api_key: ENV.fetch("OPENAI_API_KEY"), default_engine: "ada")
        return openai_client
    end
end