class Numbers
	def self.natural_multiple(multiple, num)
		sum = 0
		(1..num).each do |mcnum|
			if(mcnum % multiple[0] == 0 || mcnum % multiple[1] == 0)
				puts mcnum
				sum += mcnum
			end
		end
		sum
	end
end
describe Numbers do
	it 'should find all natural numbers below 10 that are muliples of 3' do
		Numbers.natural_multiple([3, 5], 999).should == 18
	end
end
