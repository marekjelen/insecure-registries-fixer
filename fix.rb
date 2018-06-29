#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'

path = File.join('/root', 'docker', 'daemon.json')
registries = ENV['REGISTRIES']

json = File.exist?(path) ? JSON.parse(File.read(path)) : {}

json['insecure-registries'] ||= []
json['insecure-registries'] += registries.split(';')
json['insecure-registries'] = json['insecure-registries'].reject { |c| c.empty? }

data = JSON.dump(json)

File.open(path, 'w') do |file|
  file.write(data)
end

puts `systemctl restart docker`
