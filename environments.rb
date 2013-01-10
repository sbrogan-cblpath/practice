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
