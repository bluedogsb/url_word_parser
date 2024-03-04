require "minitest/test_task"

Minitest::TestTask.create 

task :default => :test
 
task :console do
  require 'pry'
  require 'httparty'
  require 'nokogiri'
  require 'open-uri'
 
  require_relative './url_words.rb'
 
  def reload!
    files = $LOADED_FEATURES.select { |feat| feat =~ /\/url_word_parser\// }
    files.each { |file| load file }
  end
 
  ARGV.clear
  Pry.start
end