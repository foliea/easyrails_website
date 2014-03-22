class AccountTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "Account registration valid" do
    register('test_registration@example.com', 'password1234', 'password1234')
    assert_not_equal new_user_registration_path, current_path
  end

  test "Account registration invalid" do
    register('test_registration@example.com', 'password1234', '')
    assert_equal user_registration_path, current_path
  end

  private

  def register(email, password, password_confirmation)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password Confirmation', with: password_confirmation
    click_button 'register'
  end
end
