class BroadcastReceiver < Sinatra::Application
  configure :production, :staging, :shadow do
    Dir.mkdir('log') unless File.exist?('log')

    $logger = Logger.new('log/broadcast_receiver.log', 'weekly')
    $logger.level = Logger::WARN

    $stdout.reopen('log/broadcast_receiver.log', 'a+')
    $stdout.sync = true
    $stderr.reopen($stdout)
  end

  configure :development do
    $logger = Logger.new(STDOUT)
  end

  post '/_bulk' do
    content_type :json
    logger.info("Received: #{request.body.read}")
    {}.to_json
  end
end
