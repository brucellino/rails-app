require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test 'GET new' do

    get messages_url
    assert_response :success
    
    assert_select 'form' do
      assert_select 'input[type=text]'
      assert_select 'input[type=email]'
      assert_select 'textarea'
    end
  
  end
end
