require './fizzbuzz'
require 'active_support/core_ext/kernel/reporting'

describe 'fizzbuzz' do
  it 'prints buzz for numbers that are multiples of 3' do
    output = capture :stdout do
      fizzbuzz(25)
    end
      
    expect(output).to include("1\n2\nfizz\n4\nbuzz\nfizz\n7\n8\nfizz\nbuzz\n11\nfizz\n13\n14\nfizzbuzz")
  end
end

