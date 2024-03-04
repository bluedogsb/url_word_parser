class UrlWords

  attr_accessor :url
  attr_accessor :response
  attr_accessor :doc
  attr_accessor :text
  attr_accessor :all_words
  attr_accessor :all_words_hash
  attr_accessor :words_count_array

  def initialize(url: nil)
    @url = url
  end

  def run
    get_url
    get_text
    collect_words
    get_top_25
  end

  def get_url
    @doc = Nokogiri::HTML(URI.open(@url))
    @doc.css('script, link').each { |node| node.remove }

    # puts @doc
    @doc.css('body').text.squeeze(" \n")
    return "text squeezed"
  end

  def get_text
    @text = @doc.css('body').text.squeeze(" \n")
    return "got text"
  end

  def collect_words
    @all_words_hash = {}

    # remove carriage returns and tabs
    @text = @text.gsub!(/\n /, " ")
    @text = @text.gsub!(/\t/, " ")
    @text = @text.gsub!(/\n /, " ")

    # remove spaces
    @text = @text.gsub!(/\s\s/, " ") 
    @text = @text.gsub!(/\s\s/, " ") 
    @text = @text.gsub!(/\s\s/, " ") 
    @text = @text.gsub!(/\s\s/, " ") 
    @text = @text.gsub!(/\s\s/, " ") 
    @text = @text.gsub!(/\s\s/, " ") 
    @text = @text.gsub!(/â/, "")
    # puts @text

    # get words, split on spaces
    @all_words = @text.split(" ")
    
    # build hash with words and counts
    @all_words.each do |word|
      # remove non-ascii chars
      word = word.chars.select(&:ascii_only?).join
      # build hash count
      if @all_words_hash[word] == nil
        @all_words_hash[word]
        @all_words_hash[word] = 0
      end
      @all_words_hash[word] += 1
    end

    # sort hash into array
    @words_count_array = @all_words_hash.sort_by {|_key, value| value}

  end

  def get_top_25
    len = @words_count_array.length
    first = len - 25
    top_25 = @words_count_array.slice(first, 25)
  end

end