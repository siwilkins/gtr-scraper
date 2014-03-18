require File.dirname(__FILE__) + '/fundee_address_fetcher'

class GtrScraper

  def initialize(url)
    # Convert HTML URL to JSON URL, and remove page GET parameter
    @url = url.gsub(/&page=\d+/, '').gsub(/project\?/, 'project.json?')
    @fundee_address_fetcher = FundeeAddressFetcher.new
  end

  def json
    page_number = 1
    finished = false
    results = []

    # Loop while there are results to fetch
    begin

      # Fetch JSON text
      page = HTTParty.get("#{@url}&page=#{page_number}")
      if page.response.is_a?(Net::HTTPOK)
        json = JSON.parse(page.body)
        new_results = json['results']
        
        # Fetch lead organisation address for each result
        new_results.each do |result|
          @fundee_address_fetcher.insert_fundee_address!(result)
          results << result
        end
        page_number += 1
      else
        # Bad request result - assume we've done all the pages
        finished = true
      end

    end while !finished

    results.to_json
  end

end
