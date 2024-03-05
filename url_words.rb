class UrlWords

  attr_accessor :url
  attr_accessor :response
  attr_accessor :doc
  attr_accessor :text
  attr_accessor :all_words
  attr_accessor :all_words_hash
  attr_accessor :words_count_array
  attr_accessor :top_25
  attr_accessor :do_puts

  def initialize(url: nil, do_puts: false)
    @url = url
    @do_puts = do_puts
  end

  def run    
    unless get_url == false 
      puts "got url and text squeezed" if @do_puts
    else
      return "get_url found no body to parse"
    end

    unless get_text == false 
      puts "got text" if @do_puts
    else
      return "get_text found no text to squeeze"
    end
    
    unless collect_words == false
      puts "collected words" if @do_puts
    else
      return "collect_words found no words"
    end

    unless get_top_25 == false
      puts "got top 25 words" if @do_puts
      return @top_25
    else
      return "get_top_25 found no words"
    end
  end

  def get_url
    @doc = Nokogiri::HTML(URI.open(@url))
    @doc.css('script, link').each { |node| node.remove }
    @doc.css('body').text.squeeze(" \n")
    if @doc != nil
      true
    else
      false
    end
  end

  def get_text
    @text = @doc.css('body').text.squeeze(" \n")
    if @text != nil
      true
    else
      false
    end
  end

  def collect_words
    @all_words_hash = {}
    @words_count_array = []
    temp_text = @text

    ## remove carriage returns and tabs
    begin
      temp_text = temp_text.gsub!(/\n /, " ")
      temp_text = temp_text.gsub!(/\t/, " ")
      temp_text = temp_text.gsub!(/\n /, " ")
    rescue
      temp_text = @text
      puts "gsub hard return and tabs failed" if @do_puts
    end

    ## remove spaces, multiple time in case of large gaps
    begin 
      temp_text = temp_text.gsub!(/\s\s/, " ") 
      temp_text = temp_text.gsub!(/\s\s/, " ") 
      temp_text = temp_text.gsub!(/\s\s/, " ") 
      temp_text = temp_text.gsub!(/\s\s/, " ") 
      temp_text = temp_text.gsub!(/\s\s/, " ") 
      temp_text = temp_text.gsub!(/\s\s/, " ") 
      temp_text = temp_text.gsub!(/â/, "")
    rescue 
      temp_text = @text
      puts "gsub whitespace failed" if @do_puts
    end

    ## get words, split on spaces
    begin 
      @all_words = temp_text.split(" ")
    rescue
      # puts @text if @do_puts
      @all_words = @text.split(" ")
    end
    
    ## build hash with words and counts
    @all_words.each do |word|
      ## remove non-ascii chars
      word = word.chars.select(&:ascii_only?).join
      ## build hash count
      if @all_words_hash[word] == nil
        @all_words_hash[word]
        @all_words_hash[word] = 0
      end
      @all_words_hash[word] += 1
    end

    ## sort hash into array
    @words_count_array = @all_words_hash.sort_by {|_key, value| value}

    if @words_count_array != []
      true
    else
      false
    end
  end

  def get_top_25
    len = @words_count_array.length
    first = len - 25
    @top_25 = []
    @top_25 = @words_count_array.slice(first, 25)

    if @top_25 != []
      true
    else
      false
    end
  end

end