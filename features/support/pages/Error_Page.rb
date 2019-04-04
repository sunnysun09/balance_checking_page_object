class Error_Page

    include PageObject
    include PageObject::PageFactory
    
    page_url('C:/Users/test/balance_checking_new/features/error.html')
    
    h1(:error_line, visible_text: 'Login is failed! Check your username and password')
  
    def await()
      self.error_line_element.wait_until(30, "failed to wait for error page")
      $page = Error_Page
    end
end