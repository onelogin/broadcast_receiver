require 'json'
require 'logger'
require 'rubygems'
require 'sinatra'
# require 'pry'

require File.expand_path '../broadcast_receiver.rb', __FILE__

run BroadcastReceiver
