# Broadcast Receiver
## OneLogin events receiver to test Event Broadcasters

## Overview
The included project is for the purpose of receiving onelogin's account activity. It's a small server which gets events from Event Broadcaster and save it to the file, where you can analyze it.

OneLogin will review and test changes proposed by the opensource community on a qarterly basis.

## Build
These projects are written in Ruby. Requirements for building include:

1. `2.3.1` version of Ruby

### Dev Environment Setup Instructions
1. `cd; git clone https://github.com/onelogin/broadcast_receiver.git; cd broadcast_receiver`
2. `bundle`
3. `bundle exec rackup`

By default server runs on port `9292`. But you can change it by passing `-p` key with port value:
```sh
bundle exec rackup -p12345
```
Now share a web service on your local development machine to the world. This shared address you should use as `Listener URL` for the Event Broadcaster.

## Starting
You can run server in `development` mode (received data will be printed in console) or `production` mode (received data will be stored in `log/broadcast_receiver.log`)

### Unicorn
Production - `bundle exec unicorn -E production -c config/unicorn.rb`

### Webrik
Development - `bundle exec rackup`

Production - `bundle exec rackup -E production`

## Data analyzing
Event request data are stored to the `log/broadcast_receiver.log` in format:

```
I, [2016-09-29T13:05:48.188260 #1411]  INFO -- : Received:
[
  {
    "create": {"_id":"417cfdcc-5b26-4586-9e9a-2cd1d4de6880"},
    "group_id":null,
    "user_field_name":null,
    "login_id":null,
    "proxy_agent_id":null,
    "notes":"Updated: Lastname, Firstname, Username",
    "uuid":"417cfdcc-5b26-4586-9e9a-2cd1d4de6880",
    ...
    "account_id":90,
    "user_id":2992,
    "actor_system":"",
    "trusted_idp_id":null,
    "ipaddr":"170.163.3.75",
    "event_type_id":14,
    "event_timestamp":"2016-09-29 13:05:21 UTC",
    "adc_name":null,"login_name":null,"resolved_at":null,"note_id":null,
    "user_name":"Test User",
    "actor_user_name":"Something Something"
  },
  ...
]
```
Every request contains array with 10 or less events.
