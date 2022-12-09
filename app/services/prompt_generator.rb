require 'openai'

class PromptGenerator

    def self.generate_prompt_for_openai(original_prompt,tags_list,types_list)
        line_attributes = tags_list.join(" ")
        line_types = types_list.join(" ")
        return line_attributes + " " + line_types + "for " + original_prompt
    end
end