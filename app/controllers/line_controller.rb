class LineController < ApplicationController

    def create
        begin
            params = {original_prompt: "I am a 10 but i Overthink everything",tags_list: ["funny","witty"],types_list: ["pickup line","reply"]}
            tags_list = params[:tags_list]
            types_list = params[:types_list]
            original_prompt = params[:original_prompt]
            new_line = LineProducer.fetch_new_line(original_prompt,tags_list,types_list)
            if new_line
                render json: {status: 200,message: "Here is your line, good luck ahead!",line: new_line.as_json},status: :ok
            else
                render json: {status: 422,message: "No lines could be generated from these tags",line: nil},status: :unprocessable_entity
            end
        rescue Exception => e
            render json: {status: 422,message: e},status: :unprocessable_entity
        end
    end

    def mark_line_as_used
        line = Line.find(params[:line_id])
        line.update(is_used: true)
        render json: {status: 200,message: "Marked line as used!",line: line.as_json},status: :ok
    end
end
