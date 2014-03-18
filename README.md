gtr-scraper
===========

A simple ruby tool for producing JSON output of Gateway to Research project search results

# Requirements
ruby >=1.9

# Installation

1. Clone the project:

        git clone https://github.com/siwilkins/gtr-scraper.git
        
2. Install bundler (if not installed already):

        gem install bundler
        
   (depending on your setup you may need to use sudo):
   
        sudo gem install bundler
        


3. CD into the directory and install required libraries:

        cd gtr-scraper
        bundle install
        
# Usage

The purpose of the tool is to use GtR's REST api to obtain a complete (ie unpaginated) JSON output of the data from a project search.

So, if you were to search for projects which mention "dementia" funded by the MRC in a web browser on the [GtR website](http://gtr.rcuk.ac.uk/) you will be taken to [this page](http://gtr.rcuk.ac.uk/search/project?term=dementia&selectedFacets=ZnVuZGVyfG1yY3xzdHJpbmc=&page=1&fetchSize=25&selectedSortableField=&selectedSortOrder=&fields=pro.id,pro.t,pro.a,per.fn,per.on,per.sn,per.fnsn,per.org.n,per.pro.t,per.pro.abs,pub.t,pub.a,org.n). By supplying this URL to the gtr-scraper script you can get a full JSON output of these results. In addition to returning the complete result set as a single JSON object, the tool will also fetch address data on the lead organisation for each project.

## Examples

### Get projects mentioning "dementia" which are funded by MRC
        ruby gtr-scraper.rb http://gtr.rcuk.ac.uk/search/project?term=dementia&selectedFacets=ZnVuZGVyfG1yY3xzdHJpbmc=&page=1&fetchSize=25&selectedSortableField=&selectedSortOrder=&fields=pro.id,pro.t,pro.a,per.fn,per.on,per.sn,per.fnsn,per.org.n,per.pro.t,per.pro.abs,pub.t,pub.a,org.n
 
  
### Get all projects
        ruby gtr-scraper.rb http://gtr.rcuk.ac.uk/search/project?term=*
        
### Output data to file
        ruby gtr-scraper.rb http://gtr.rcuk.ac.uk/search/project?term=* > all-projects.json
        
## Next steps
Having obtained the JSON data from the API, the data can then be parsed and processed with a tool such as [OpenRefine](http://openrefine.org/).
