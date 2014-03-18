#
# Copyright (C) 2014 Simon Wilkins
# License: http://www.gnu.org/licenses/gpl.html GPL version 2 or higher
#

# This class is responsible for fetching the addresses of fundee organisations
class FundeeAddressFetcher

  def initialize
    # Setup cache
    @fundee_address_cache = {}
  end

  def insert_fundee_address!(result_hash)
    fundee = result_hash['projectComposition']['leadResearchOrganisation']

    result_hash['projectComposition']['leadResearchOrganisation']['address'] = get_address(fundee)
    result_hash
  end

  private
  def get_address(fundee_hash)
    fundee_id = fundee_hash['id']

    # Return nil if fundee_id is blank
    return nil unless fundee_id =~ /\w/

    if address = @fundee_address_cache[fundee_id]
      return address
    else
      fundee_url = "#{fundee_hash['url']}.json"
      fetch_address(fundee_id, fundee_url)
    end
  end

  def fetch_address(fundee_id, fundee_url)
    begin
      fundee_page = HTTParty.get(fundee_url)
      fundee_json = JSON.parse(fundee_page.body)
      @fundee_address_cache[fundee_id] = fundee_json['organisationOverview']['organisation']['address']
    rescue
      # Output URL and exit if error
      puts fundee_url
      exit
    end
  end

end

