class SampleFrame
  
  def initialize
    @list = []
  end

  def assign_specs_names 
     Dir.new('/home/manoj/Desktop/try-capybara/spec').each {|file| @list << file  }
  end
  
  def display_spec_from_list_to_run
   "\n"
   @number = 1
   @list.each do |a| 
       print @number
       "\n"
       puts a 
       @number = @number+1
   end 
  end
  
  def select_spec_to_run
   p "enter spec number to run"
   @choice = gets.chomp.to_i
  end
  
  def run_spec_and_error_log
   choice =p @list[@choice]
   result = `rspec spec/#{choice}`
   p result
  end


end
start= SampleFrame.new
start.assign_specs_names 
start.display_spec_from_list_to_run
start.select_spec_to_run
start.run_spec_and_error_log
