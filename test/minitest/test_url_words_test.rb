require 'minitest/autorun'
require 'nokogiri'
require 'open-uri'
require_relative '../../url_words'

class TestUrlWords < Minitest::Test

  def test_url_words_test
    ## Url content saved as of 2024/04/04 3:45pm PST from CNN
    url = "https://www.cnn.com/2024/02/23/tech/att-outage-customer-service/index.html"
    uw = UrlWords.new(url: url)
    expected = [["2024", 8],
 ["he", 8],
 ["US", 9],
 ["its", 9],
 ["by", 9],
 ["customers", 10],
 ["Markets", 10],
 ["TV", 10],
 ["have", 10],
 ["&", 11],
 ["for", 12],
 ["Ad", 12],
 ["outage", 12],
 ["Log", 12],
 ["is", 12],
 ["in", 13],
 ["a", 17],
 ["AT&T", 17],
 ["was", 17],
 ["on", 21],
 ["of", 24],
 ["and", 25],
 ["to", 29],
 ["CNN", 36],
 ["the", 52]]
    assert(expected, uw.run)
  end

end