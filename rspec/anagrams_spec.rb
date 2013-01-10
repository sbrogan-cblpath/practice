#To find an anagram
#We need to take each letter from a word
#And compare it to a list of words
#Then find the words containing those letters
describe Anagram do

  context "#find_words" do

    let (:anagram) { Anagram.new }

    it 'finds a list of words containing the letters from the original word' do
      anagram.find_words('skins').should include('sinks', 'skins')
    end
  end
end
