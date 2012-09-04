class Something
  def self.say_something
    'something'
  end
end
describe Something do
  context '#saying something' do
    it "should say 'something'" do
      Something.say_something.should == 'something'
    end
  end
end
