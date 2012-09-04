class Alarm
	def initialize(time)
		@time = time
		@alarm = []
	end

	def set_alarm(alarm_number, time)
		exist = @alarm[alarm_number].nil?
		@alarm[alarm_number] = time
		exist ? "OK" : "Changed"
	end

	def alarm(num)
		@alarm.fetch(num)
	end

	attr_reader :time
end

describe Alarm do
	let (:time) { Time.now }
	let (:alarm) {Alarm.new(time)}
	it 'should set the time when passed in' do
		Alarm.new(time).time.should == time
	end

	it 'should set the alarm1 time' do
		alarm.set_alarm(1, "5:00 PM").should == "OK"
	end

	it 'should change the alarm1 time' do
		alarm.set_alarm(1, "5:00 PM")
		alarm.set_alarm(1, "6;00 PM").should == "Changed"
	end

	it 'should get the alarm time' do
		alarm.set_alarm(1, '5:00 PM')
		alarm.alarm(1).should == '5:00 PM'
	end
end
