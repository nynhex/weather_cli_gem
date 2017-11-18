#!/usr/bin/env ruby
require 'weather'

app_id = "43d036eb95b72fb60098696415d53616"
city   = ARGV[0]

abort "WEATHER_APP_ID environment variable is not set" unless app_id
abort "Provide a city as argument" unless city

gateway = Weather::Gateway.new(app_id)
samples = gateway.forecast(city)

puts "Weather forecast for #{city}"
puts "DATE\tTEMP(min)\tTEMP(max)\tDESCRIPTION"
samples.each do |sample|
  puts "#{sample.date}\t#{sample.temp_min}\t#{sample.temp_max}\t#{sample.description}"
end
