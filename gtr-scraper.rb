require 'httparty'
require File.dirname(__FILE__) + '/lib/gtr_scraper'

scraper = GtrScraper.new(ARGV[0])
puts scraper.json
