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

    # In development Sinatra only permits localhost, *.localhost, *.test and IP
    # Host headers by default, which rejects the public hostname used as the
    # Listener URL.
    set :host_authorization, { permitted_hosts: [] }
  end

  ['/', '/_bulk'].each do |path|
    post path do
      content_type :json
      logger.info("Received: #{request.body.read}")
      {}.to_json
    end
  end
end
