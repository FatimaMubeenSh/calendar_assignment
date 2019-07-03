require 'date'
require_relative 'calendar.rb'

describe Calendar do
	context " Testing the Calendar Class " do calendar1 = Calendar.new(2019)
		it " should add event when add_event method is called" do
			calendar1.add_event("Birthday","party hard",Date.new(2019,11,20))
			calendar1.add_event("gtg","meet friends",Date.new(2019,11,15))
			expect(calendar1.events.count).to eq 2 
		end

		it " should return event(s) at specified date when event_at method is called" do
			e = calendar1.event_at(Date.new(2019,11,20))
			expect(e.count).to eq 1 
		end

		it " should return event(s) within specified month when event_in_month method is called" do
			e = calendar1.event_in_month(11)
			expect(e.count).to eq 2 
		end

		it " should remove event from a calendar when remove_event method is called" do
			calendar1.remove_event("gtg")
			expect(calendar1.events.count).to eq 1 
		end

		it " should return true when the event exists in calendar and false when it doesnt using has_event? method" do
			result = calendar1.has_event?("gtg")
			expect(result).to be false 
		end
	end
end