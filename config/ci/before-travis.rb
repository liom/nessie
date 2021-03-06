#!/usr/bin/env ruby

require 'fileutils'

# copy config files
Dir['config/examples/*'].each do |source|
  destination = "config/#{File.basename(source)}"
  unless File.exist? destination
    FileUtils.cp(source, destination)
    puts "Generated #{destination}"
  end
end

# run rake and setup tasks
system "bundle"
system "bundle exec rake db:create:all"
system "bundle exec rake db:migrate --trace"