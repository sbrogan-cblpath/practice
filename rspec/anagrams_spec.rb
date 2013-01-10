class WordList
end

class Anagram
  def initialize
    @word_list = WordList.get_list
  end

  attr_reader :word_list

  def find_words(word)
    word.each_char do |char|
      @word_list.select! {|w| w =~ /(#{char}[a-zA-z]*){#{word.count(char)}}/}
    end
  end
end





#To find an anagram
#We need to take each letter from a word
#And compare it to a list of words
#Then find the words containing those letters
describe Anagram do

  context "#find_words" do

    let (:anagram) { Anagram.new }

    before :each do
      WordList.stub(:get_list) {['something','bar', 'sinks','skins','skunk','skin']}
      anagram.find_words('skins')
    end

    it 'finds a list of words containing the letters from the original word' do
      anagram.word_list.should include('sinks', 'skins')
    end
  end
end
