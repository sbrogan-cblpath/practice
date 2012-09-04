class RaceCar
	def initialize(str)
		@str = str
		@reverse = str.reverse

	end
	
	def reversable?
		if(@str == @reverse)
			return true
		end
		return false
	end
	attr_accessor :reverse


end

describe RaceCar do
	it 'reverses the letters' do
		RaceCar.new('happy').reverse.should == 'yppah'
	end

	it 'checks to see if the reverse matches the inputted string' do
		RaceCar.new('racecar').should be_reversable
	end
end
