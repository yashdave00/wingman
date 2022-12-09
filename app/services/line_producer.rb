require 'openai'

class LineProducer

    def self.fetch_new_line(original_prompt,tags_list,types_list)
        client = OpenaiAuth.fetch_client
        prompt_generator_result = PromptGenerator.generate_prompt_for_openai(original_prompt,tags_list,types_list)
        requested_line_obj = client.completions(prompt: prompt_generator_result, max_tokens: 250)
        requested_line = requested_line_obj.as_json["choices"][0]["text"]
        line = Line.create!(line_text: requested_line,is_used: false,source: "davinci")
        if line
            return line
        else
            return nil
        end
    end
end