class BroadcastReciever < Sinatra::Base
  configure {
    enable :logging
  }

  post '/_bulk' do
    content_type :json
    logger.info("Recieved: #{request.body.read}")
    {}.to_json
  end
end
