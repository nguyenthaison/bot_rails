require 'rest-client'

class ReplyMessagesService
  def perform params, access_token
    conversation = params['conversation']
    bot          = params['recipient']
    user         = params['from']
    activity_id  = params['id']
    service_url  = params['serviceUrl']
    url = service_url + '/v3/conversations/' + conversation['id'] + '/activities/' + activity_id
    begin
      RestClient.post url,
        {
          "type": "message",
          "from": {
            "id": bot["id"],
            "name": bot["name"],
          },
          "conversation": {
            "id": conversation['id'],
          },
          "recipient": {
            "id": user["id"],
            "name": user["name"],
          },
          "text": "minh cho",
           "replyToId": activity_id,
        }.to_json,
        {
          "authorization": "Bearer " + access_token,
          "content_type": "application/json"
        }
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end
