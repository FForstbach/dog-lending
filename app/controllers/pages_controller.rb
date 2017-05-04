class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :registration_choice ]

  def home
  end

  def dashboard
    @user = current_user
    user_id = current_user.id
    @dogs = Dog.where(user_id: user_id)
    # @messages = @user.messages
  end
end
