require 'watir'
require 'page-object'
require 'page-object/page_factory'

World(PageObject::PageFactory)

Before do 
    #Selenium::WebDriver::Chrome.driver_path="/Users/Me/Downloads/chromedriver"
    @browser = Watir::Browser.new :chrome
end

After do
    @browser.close
end