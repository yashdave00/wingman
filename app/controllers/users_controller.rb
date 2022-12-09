require 'active_support'

class UsersController < ApplicationController

    def create
        begin
            key = SecureRandom.random_bytes(32)
            crypt = ActiveSupport::MessageEncryptor.new(key)
            encrypted_data = crypt.encrypt_and_sign(params[:password])
            password = crypt.decrypt_and_verify(encrypted_data)
            User.create!(first_name: params[:first_name],last_name: params[:last_name],gender: params[:gender],date_of_birth: Date.parse(params[:date_of_birth]),email: params[:email],encrypted_password: password)
            render json: {status: 201,message: "Created successfully!"},status: :ok
        rescue Exception => e
            render json: {status: 422,message: e},status: :unprocessable_entity
        end
    end

    def index
        
    end
    
end
