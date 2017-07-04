require 'rest-client'

class AuthenticationService
  attr_reader :response
  def perform
    @response = RestClient.post "https://login.microsoftonline.com/botframework.com/oauth2/v2.0/token",
      {'grant_type'    => 'client_credentials',
        'client_id'     => 'cf3e5988-9532-444e-9b1d-07d6be869dad',
        'client_secret' => 'ovDOcQAO7vQYcWm0FgCXit5',
        'scope'         => 'https://api.botframework.com/.default'},
      {content_type: "application/x-www-form-urlencoded"}
    @response.code == 200
  end
end
