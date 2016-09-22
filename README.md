# BroadcastReceiver
Broadcast Receiver is used to test Event Broadcasters.

## Starting

### Unicorn (AWS instance)
`bundle exec unicorn -E production -c config/unicorn.rb`

### Webrik
Development - `bundle exec rackup`

Production - `bundle exec rackup -E production`

## Usage
Evert request data is stored to the `log/broadcast_reciever.log`

Format: `I, [2016-09-12T17:17:10.506751 #54645]  INFO -- Received: [{...}]`
