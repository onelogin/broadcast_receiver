class BroadcastReciever < Sinatra::Application
  configure :production, :staging, :shadow do
    Dir.mkdir('log') unless File.exist?('log')

    $logger = Logger.new('log/broadcast_reciever.log', 'weekly')
    $logger.level = Logger::WARN

    $stdout.reopen('log/broadcast_reciever.log', 'a+')
    $stdout.sync = true
    $stderr.reopen($stdout)
  end

  configure :development do
    $logger = Logger.new(STDOUT)
  end

  post '/_bulk' do
    content_type :json
    logger.info("Recieved: #{request.body.read}")
    {}.to_json
  end
end
