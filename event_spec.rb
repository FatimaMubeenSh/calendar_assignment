require 'date'
require_relative 'event.rb'

describe Event do
	context "Testing the Event class" do 
		it "should update instance variable name when we call name= method" do
			e = Event.new("Graduation", "Get passes", Date.new(2019, 11, 23))
			e.name= "Convocation"
			expect(e.name).to eq "Convocation"
		end

		it "should update instance variable description when we call description= method" do
			e = Event.new("Graduation", "Get passes", Date.new(2019, 11, 23))
			e.description= "register passes"
			expect(e.description).to eq "register passes"
		end
		
		it "should update instance variable date when we call date= method" do
			e = Event.new("Graduation", "Get passes", Date.new(2019, 11, 23))
			e.date= Date.new(2019, 12, 8)
			expect(e.date).to eq Date.new(2019, 12, 8)
		end
	end
end