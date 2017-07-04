class Api::V1::MessagesController < ActionController::Base
  def create
    if (service = AuthenticationService.new).perform
      response = service.response
      access_token = eval(response.body)[:access_token]
      if params["text"]
        ReplyMessagesService.new.perform(params, access_token)
      end
    end
  end
end
