require_relative '../lib/Common.rb'

class Login_Page

    include PageObject
    include PageObject::PageFactory
    
    page_url('C:/Users/test/balance_checking_new/features/login.html')
    
    h1(:login_line, :text => 'Login page for balance detail checking')
    text_field(:login_user, :name => 'fname')
    text_field(:login_passwd, :name => 'passwd')
    button(:login_button, :id => "Login")

    # for page object, do not define initialize; instead, define initialize_page
    def initialize_page
      @account_yml = Common.new.read_yml_file('features/config/balance_checking_account.yml')
    end

    def await()
      self.login_line_element.wait_until(30, "failed to wait for login page")
      $page = Login_Page
    end

    def login(username, password)
      self.login_user = username
      self.login_passwd = password
      sleep 1

      users = @account_yml['users']
      users.each do |key, value|
        if key == username and value == password
          login_button
          $page = BalanceDetail_Page
        else
          visit("Error_Page").await
          $page = Error_Page
        end
      end
    end    
end
