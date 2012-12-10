class Something
	ENV['ENV'] ||= 'test'
	def self.test
		if ENV['ENV'] == 'test'
			puts 'test'
		else
			puts 'production'
		end
	end
end

Something.test

y = ['1','2','3','4'].each do |x| 
  return x.succ
end
puts y.inspect + "is the value of Y"
