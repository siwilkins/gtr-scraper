#
# Copyright (C) 2014 Simon Wilkins
# License: http://www.gnu.org/licenses/gpl.html GPL version 2 or higher
#

require 'httparty'
require File.dirname(__FILE__) + '/lib/gtr_scraper'

scraper = GtrScraper.new(ARGV[0])
puts scraper.json
