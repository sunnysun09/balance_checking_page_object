class BalanceDetail_Page

  include PageObject
  include PageObject::PageFactory
  
  page_url('C:/Users/test/balance_checking_new/features/detail.html')
  
  form(:balance_detail_form, :action => '/action_page.php')

  label(:value1, :for=>"Value1")
  label(:value2, :for=>"Value2")
  label(:value3, :for=>"Value3")
  label(:value4, :for=>"Value4")
  label(:value5, :for=>"Value5")
  label(:total_balance, :for=>"Total Balance")

  text_field(:txt_val_1, :id => 'txt_val_1')
  text_field(:txt_val_2, :id => 'txt_val_2')
  text_field(:txt_val_3, :id => 'txt_val_3')
  text_field(:txt_val_4, :id => 'txt_val_4')
  text_field(:txt_val_5, :id => 'txt_val_5')
  text_field(:txt_ttl_val, :id => 'txt_ttl_val')

  def await()
    self.balance_detail_form_element.wait_until(30, "failed to wait for balance detail page")
  end

  def verify_labels_and_textfields  
    puts "      Verify labes and textfields appear"
    raise "label check error" unless (value1_element.present? && value2_element.present? \
      && value3_element.present? && value4_element.present? && value5_element.present?)

    raise "textfield check error" unless (txt_val_1_element.present? && txt_val_2_element.present? \
      && txt_val_3_element.present? && txt_val_4_element.present? && txt_val_5_element.present?)
  
    @val1_str = txt_val_1
    @val2_str = txt_val_2
    @val3_str = txt_val_3
    @val4_str = txt_val_4
    @val5_str = txt_val_5
    @balance_str = txt_ttl_val  
  end
  
  def verify_values_appear
    puts "      Verify values appear"
    if (@val1_str.empty? && @val2_str.empty? && @val3_str.empty? \
          && @val4_str.empty? && @val5_str.empty? && @balance_str.empty?)
      raise "Value fields should appear"
    end
  end
  
  def verify_values_currency_format
    puts "      Verify values are in currency format"   
    if check_currency_format(@val1_str) || check_currency_format(@val2_str) \
        || check_currency_format(@val3_str) || check_currency_format(@val4_str) \
        || check_currency_format(@val5_str) || check_currency_format(@balance_str)
      raise "Value fields are not in currency format"
    end    
    @val1 =  currency_to_float(@val1_str)
    @val2 =  currency_to_float(@val2_str)
    @val3 =  currency_to_float(@val3_str)
    @val4 =  currency_to_float(@val4_str)
    @val5 =  currency_to_float(@val5_str)
    @balance =  currency_to_float(@balance_str)
  end
  
  def verify_values_greater_than_zero
    puts "      Verify values larger than 0"
    if @val1.zero? || @val2.zero? || @val3.zero? || @val4.zero? || @val5.zero?
      raise "Value fields should be greater than 0"
    end
  end
  
  def verify_balance_correct
    puts "      Verify balance is right"
    @calc_total = @val1 + @val2 + @val3 + @val4 + @val5     # + 3000
    if !(@calc_total -  @balance).zero?
      raise "Total balance should be $#{@calc_total}, not $#{@balance}"
    end
  end
  
  # check whether the currency is in "$23,329.50" format
  def check_currency_format(currency)
    currency.gsub(/^(?!0\.00)\d{1,3}(,\d{3})*(\.\d\d)?$/, '').empty?
  end
  
  def currency_to_float(currency)
    currency.gsub(/[^\d^\.]/, '').to_f
  end
  
  def verify_balance
    verify_labels_and_textfields
    verify_values_appear
    verify_values_currency_format
    verify_values_greater_than_zero
    verify_balance_correct
  end

end
