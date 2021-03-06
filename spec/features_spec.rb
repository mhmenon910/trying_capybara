require_relative '../simple_app.rb'
require 'spec_helper.rb'

 describe 'Expense tracker login', :js => true do 
   it "should login to post a new expense" do
     # Log in
     sleep 3
     visit 'http://localhost:5000'
     click_link("Log in")
     sleep 3
     fill_in("session_email", :with => "mhmenon910@gmail.com")
     sleep 3
     fill_in("session_password", :with => "12345678")
     sleep 3
     click_button("Log in")
     page.should have_content("mhmenon910@gmail.com")


     # show errors while creating new expense
     sleep 3
     visit 'http://localhost:5000/expenses/new'
     sleep 3
     fill_in("expense_name", :with => "Rent")
     sleep 3
     fill_in("expense_cost", :with => "")
     sleep 3
     fill_in("expense_date", :with => Date.today)
     click_button("Create expense")
     page.should have_content("Cost can't be blank")


     # create new expense
     sleep 3
     visit 'http://localhost:5000/expenses/new'
     sleep 3
     fill_in("expense_name", :with => "Rent")
     sleep 3
     fill_in("expense_cost", :with => "9000")
     sleep 3
     fill_in("expense_date", :with => Date.today)
     click_button("Create expense")
     page.should have_content("Expense was successfully created")


     # edit expense
     sleep 3
     first(:link, "Edit").click
     sleep 3
     fill_in("expense_name", :with => "Apple Juice")
     sleep 3
     fill_in("expense_cost", :with => "20")
     sleep 3
     fill_in("expense_date", :with => Date.today)
     click_button("Update expense")
     page.should have_content("Expense updated")

     # Profile show
     sleep 3
     click_link("view my profile")
     page.should have_content("mhmenon910@gmail.com")
     sleep 3 

     # Calculate Total Expenses
     visit 'http://localhost:5000/expenses/total'  
     fill_in("from_date", :with => Date.today)
     sleep 3
     fill_in("to_date", :with => Date.today)
     sleep 3
     click_button("Calculate total")
     sleep 3
     page.should have_content("The total expenses incurred between 21 January, 2016 and 21 January, 2016 amounts to: ")

     # Delete created expense
      sleep 3
      visit 'http://localhost:5000/'
      first(:link, "Delete").click
      sleep 3
      page.driver.browser.switch_to.alert.accept
      sleep 3
      page.should have_content("Expense deleted successfully")
      sleep 2

   end
 end







