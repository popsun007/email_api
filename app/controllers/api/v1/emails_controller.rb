module API
  module V1
    class EmailsController < ApplicationController
      def create
        @email = email_params
        EmailMailer.eamil_body(@eamil).deliver
        render json: {status: 'SUCCESS', message: 'Sent email', data: @email}, status: :ok
      end

      private

        def email_params
          params.permit(:to, :subject, :body)
        end
    end
  end
end
