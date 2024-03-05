require 'minitest/autorun'
require 'nokogiri'
require 'open-uri'
require_relative '../../url_words'

class TestUrlWords < Minitest::Test

  def test_url_words_cnn_news_test
    ## Url content saved as of 2024/04/04 3:45pm PST from CNN
    url = "https://www.cnn.com/2024/02/23/tech/att-outage-customer-service/index.html"
    uw = UrlWords.new(url: url, do_puts: false)
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

  def test_url_words_variety_test
    url = "https://variety.com/2024/film/news/dune-2-box-office-analysis-opening-weekend-timothee-chalamet-1235928762/" 
    uw = UrlWords.new(url: url, do_puts: false)
    expected = [["TV", 10],
                ["More", 10],
                ["Global", 10],
                ["Account", 10],
                ["Film", 10],
                ["that", 11],
                ["is", 12],
                ["sub", 13],
                ["menu", 14],
                ["Expand", 15],
                ["Digital", 15],
                ["for", 16],
                ["Archives", 17],
                ["Dune", 17],
                ["VIP+", 18],
                ["Plus", 22],
                ["Icon", 22],
                ["in", 22],
                ["Subscribe", 25],
                ["and", 37],
                ["a", 39],
                ["of", 44],
                ["Variety", 49],
                ["to", 61],
                ["the", 97]]
    assert(expected, uw.run)
  end


end