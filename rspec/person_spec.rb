require 'active_model'

class Person
include ActiveModel::Validations
	def initialize(attr_hash)
		@first_name = attr_hash[:first_name]
		@last_name = attr_hash[:last_name]
		@name = @first_name.to_s + ' ' + @last_name.to_s
		@middle_name = attr_hash[:middle_name]
	end


	validates_presence_of :last_name

	attr_reader :first_name,
		:last_name,
		:name
	attr_accessor :middle_name
end
describe Person do

	it 'should have a first_name' do
    p = Person.new(:first_name => 'John')
		p.first_name.should == "John"
	end

	it 'should be valid with a last name' do
		p = Person.new(:last_name => "Doe")
		p.should be_valid
	end

	it 'should have a last_name' do
		p = Person.new(:last_name => 'Doe')
		p.last_name.should == 'Doe'
	end
	it "can construct a full name from the first and last name" do
		p = Person.new(:last_name => "Doe", :first_name => "John")
		p.name.should == "John Doe"
	end

	it  "has an optional middle name" do
		p = Person.new(:last_name => "Doe", :first_name => "John") 
		p.should be_valid
		p.middle_name = 'Bill'
		p.should be_valid
	end
		
end
