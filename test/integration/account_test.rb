class AccountTest < ActionDispatch::IntegrationTest
  fixtures :all
  
  test "Account registration valid" do
    register('test_registration@example.com', 'password1234', 'password1234')
    assert_not_equal new_registration_path, current_path
  end
  
  private
  
  def register(email, password, password_confirmation)
    visit new_registration_path
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'submit'
  end
end