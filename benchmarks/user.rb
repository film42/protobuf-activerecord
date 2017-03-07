require "protobuf-activerecord"
require "benchmark/ips"

require 'support/db'
require 'support/models'
require 'support/protobuf'

ActiveRecord::Base.logger = nil

User.protobuf_message(UserMessage, {})

user = User.new(:guid => SecureRandom.uuid,
                :first_name => "Ronald",
                :last_name => "Swanson",
                :email => "ron.swandawg@gmail.com",
                :password => SecureRandom.uuid)

Benchmark.ips do |x|
  x.report("serialize") { user.to_proto }
end
