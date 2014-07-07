require_relative 'predictor'
require "pry-debugger"

class ComplexPredictor < Predictor
  # public: trains the predictor on books in our dataset. this method is called
  # before the predict() method is called.
  #
  # returns nothing.
  def train!
    @data = {}

    #TF IDF vars
    #TF of every word in category
    @books = 0

    @all_books.each do |category, books|
      @data[category] = { book_histos: Array.new,
                          docs_with_word: Hash.new(0),
                          cat_histo: Hash.new(0)
      }

      books.each do |filename, tokens|
        @books += 1
        book = Hash.new(0)
        tokens.each do |word|
          book[word] += 1
        end

        @data[category][:book_histos] << book

      end

      @data[category][:book_histos].each do |histogram|
        histogram.each do |word, count|
          @data[category][:docs_with_word][word] += 1
          @data[category][:cat_histo][word] += count
        end
      end

      #get the TF score per category
      max_word = @data[category][:cat_histo].max_by { |word, count| count }
      binding.pry
      @data[category][:cat_histo].each do |word, count|
        #override count with TF for category for word
        @data[category][:cat_histo][word] = count / max_word
      end
    end
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    tests = 4
    score = {}
    tests.times { |x| score["test#{x+1}".to_sym] = 0 }

    #Test 1
    @data.each do |category, histogram|

      score[category]

      word_count = 0
      language = false
      title = false

          if word_count < 150
            word_count += 1
            title = true if word == "title"
            language = true if word == "language"
            book
          end
            
    # Always predict astronomy, for now.
    :astronomy
    end
  end
end

