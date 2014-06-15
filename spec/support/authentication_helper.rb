require 'spec_helper'

module AuthenticationHelper
  def authenticate
    register
    sign_in
  end

  def register(user_factory = :user)
    visit_then_fill_and_submit_form(new_user_registration_path, :create,
      :user, user_factory)
  end

  def sign_in(user_factory = :user)
    visit_then_fill_and_submit_form(new_user_session_path, :new,
      :user, user_factory, [:email, :password])
  end

  def sign_out
    visit destroy_user_session
  end

  def visit_then_fill_and_submit_form(path, action, model, factory, selected_attributes = [])
    visit path

    attributes = attributes_for(factory)
    attributes = attributes.slice(*selected_attributes) unless selected_attributes.empty?

    fill_form(model, attributes)

    click_button submit(model, action)
  end
end
