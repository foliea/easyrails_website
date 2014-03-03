class Admins::SessionsController < Devise::SessionsController
  before_filter :authenticate_admin!, only: [:show, :new, :create, :edit, :update, :destroy]
end