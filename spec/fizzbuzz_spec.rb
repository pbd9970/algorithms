require './fizzbuzz'
require 'active_support/core_ext/kernel/reporting'

describe 'fizzbuzz' do
  it 'prints buzz for numbers that are multiples of 3' do
    expect(fizzbuzz(15).to match_stdout("1\n2\nfizz\n4\nbuzz\nfizz\n7\n8\nfizz\nbuzz\n11\nfizz\n13\n14\nfizzbuzz")
  end
end
#    output = capture :stdout do
#      fizzbuzz(25)
#    end
#      
#    expect(output).to include("1\n2\nfizz\n4\nbuzz\nfizz\n7\n8\nfizz\nbuzz\n11\nfizz\n13\n14\nfizzbuzz")
#  end
#  
#  it 'prints buzz for numbers that are multiples of 3' do
#    STDOUT.should_receive(:puts).with("1")
#    STDOUT.should_receive(:puts).with("2")
#    STDOUT.should_receive(:puts).with("fizz")
#    STDOUT.should_receive(:puts).with("4")
#    STDOUT.should_receive(:puts).with("buzz")
#    STDOUT.should_receive(:puts).with("fizz")
#    STDOUT.should_receive(:puts).with("7")
#    STDOUT.should_receive(:puts).with("8")
#    STDOUT.should_receive(:puts).with("fizz")
#    STDOUT.should_receive(:puts).with("buzz")
#    STDOUT.should_receive(:puts).with("11")
#    STDOUT.should_receive(:puts).with("fizz")
#    STDOUT.should_receive(:puts).with("13")
#    STDOUT.should_receive(:puts).with("14")
#    STDOUT.should_receive(:puts).with("fizzbuzz")
#    STDOUT.should_receive(:puts).with("16")
#    STDOUT.should_receive(:puts).with("17")
#    STDOUT.should_receive(:puts).with("fizz")
#    STDOUT.should_receive(:puts).with("19")
#    STDOUT.should_receive(:puts).with("buzz")
#    STDOUT.should_receive(:puts).with("fizz")
#    STDOUT.should_receive(:puts).with("22")
#    STDOUT.should_receive(:puts).with("23")
#    STDOUT.should_receive(:puts).with("fizz")
#    STDOUT.should_receive(:puts).with("25")
#    STDOUT.should_receive(:puts).with("26")
#    STDOUT.should_receive(:puts).with("fizz")
#    STDOUT.should_receive(:puts).with("28")
#    STDOUT.should_receive(:puts).with("29")
#    STDOUT.should_receive(:puts).with("fizzbuzz")
#    require_relative '../fizzbuzz.rb' #load/run the file 
#    fizzbuzz(30)
#      

