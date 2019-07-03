require 'date'
require_relative 'event.rb'

class Calendar
  attr_reader :year, :events

  def initialize(calendar_year = Date.today.year)
  	@events = []
    @year = calendar_year
  end

  def add_event(e_name,e_description,e_date)
    e1= Event.new(e_name, e_description,e_date)
  	@events.push e1
  end

  def remove_event(e_name)
    @events.delete_if {|e| e.name == e_name } 
  end

  def edit_event(current_e_name,update_name,update_description,update_date)
    @events.each do |e|
      if e.name == current_e_name
        e.name= update_name
        e.description= update_description
        e.date= update_date
      end
    end
  end

  def event_at(e_date)
    result = @events.select { |e| e.date == e_date}
  end

  def print_monthlyView(e_month)
    total_days = Date.new(@year,e_month,-1).day
    day_slot = Date.new(@year,e_month,1).wday
    puts "****** Viewing Calendar of #{Date::MONTHNAMES[e_month]} , #{@year} ******"
    puts "Sun \t Mon \t Tue \t Wed \t Thurs \t Fri \t Sat\n"
    day_slot.times { print "\t"}
    1.upto(total_days) do |i|
      print i 
      total_events = event_at(Date.new(@year,e_month,i)).count
      print "[#{total_events}]" if total_events > 0
      day_slot += 1
      if day_slot % 7 == 0
        print "\n"
      else
        print "\t"
      end
    end
  end

  def event_in_month(e_month)
    result = @events.select { |e| e.date.month == e_month }
  end

  def view_events(events_arr = @events)
    events_arr.each { |e| puts e }
  end

  def has_event?(e_name)
    @events.each { |e| return true if e_name == e.name }
    return false
  end

  def get_event(e_name)
    result = @events.select { |e| e.name == e_name}
  end
end
