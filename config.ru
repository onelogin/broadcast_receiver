require 'json'
require 'rubygems'
require 'sinatra'
# require 'pry'

require File.expand_path '../broadcast_reciever.rb', __FILE__

# BroadcastReciever logs
FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new('log/broadcast_reciever.log', 'a')
$stdout.reopen(log)
$stderr.reopen(log)

run BroadcastReciever
