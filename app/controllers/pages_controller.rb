class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :registration_choice ]

  def home
  end

  def dashboard
    @user = current_user
    @dogs = @user.dogs
    # @messages = @user.messages
  end
end
