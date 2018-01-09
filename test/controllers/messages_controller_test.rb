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

  test 'POST create' do
    
    post messages_path, params: { 
      message: {
        name: 'Bruce Becker', 
        email: 'brucellino@gmail.com',
        body: 'Testing body'
      }
    }
    
    assert_redirected_to new_message_url
    follow_redirect!
    assert_match /Thanks for the message!/, response.body
  end

  test 'Invalid POST create' do
    post messages_path
  end

end
