#Refactored a bit
#Instead of using an attr_reader I defined my own and initialized and set the value in there
#We are now setting the word on initialize when creating an instance of Anagram
#put find_words in private since that method won't get called outside of the class
class WordList
end

class Anagram
  def initialize(word)
    @word = word
  end

  def word_list
    @word_list ||= WordList.get_list
    find_words
    @word_list
  end

  private

  def find_words
    @word.each_char do |char|
      @word_list.select! {|w| w =~ /(#{char}[a-zA-z]*){#{@word.count(char)}}/}
    end
  end
end





#To find an anagram
#We need to take each letter from a word
#And compare it to a list of words
#Then find the words containing those letters
describe Anagram do

  context "#word_list" do

    let (:anagram) { Anagram.new('skins') }

    before :each do
      WordList.stub(:get_list) {['something','bar', 'sinks','skins','skunk','skin']}
    end

    it 'finds a list of words containing the letters from the original word' do
      anagram.word_list.should include('sinks', 'skins')
    end
  end
end
