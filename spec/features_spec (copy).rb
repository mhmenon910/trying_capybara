require_relative '../simple_app.rb'
require 'spec_helper.rb'

 describe 'Expense tracker login', :js => true do 
   it "should login to post a new expense" do
     # Log in
     sleep 3
visit 'http://localhost:5000'
     page.should have_content("Home")

   end
 end







