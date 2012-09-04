class Compress 
	def initialize(words)
		@unique_words = words.split(' ').uniq
		@compress = compress_words(words)
	end
	attr_reader :unique_words,
		:compress

	def compress_words(words)
		return_array = []
		words.split(' ').each do |word|
			return_array << @unique_words.index { |unique_word| unique_word == word }
		end
		return_array
	end

	def whaddup (thing)
			if thing
				' '
			else
				''
			end
	end
	def decompress
		lam = proc { |thing|
			if thing
				' '
			else
				''
			end
		}
		return_string = ''
		@compress.each_with_index do |comp, index|
		  return_string << @unique_words[comp] << lam.call(index != @compress.length - 1)
		end
	  return_string
	end	
end
describe Compress do
	it 'should set an array of unique words from the words passed into the constructor' do
		Compress.new('this is a string of a string of words').unique_words.should == %w(this is a string of words)
	end

	it 'should set an array containing the index of the words passed into the constructor' do
		Compress.new('this is a string of a string of words').compress.should == [0,1,2,3,4,2,3,4,5]
	end

	it 'should decompress said compressed string' do
		comp = Compress.new('this is a string of a string of words')
		comp.decompress.should == ('this is a string of a string of words')
	end
end
