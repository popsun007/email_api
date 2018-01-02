module Api
  module V1
    class EmailsController < ApplicationController
      VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

      def create
        @email = email_params

        if is_valid_email?(@email[:to])
          EmailMailer.send_email(@email).deliver
          render json: {status: 'SUCCESS', message: 'Sent email', data: @email}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Email Address Invalid'}, status: :unprocessable_entity
        end
      end

      private

        def email_params
          params.permit(:to, :subject, :body)
        end

        def is_valid_email?(email)
          email =~ VALID_EMAIL_REGEX
        end
    end
  end
end
