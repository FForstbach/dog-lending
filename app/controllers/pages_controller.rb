class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :registration_choice ]

  def home
    @dogs = Dog.all
    @dog_locations = ""
    @dogs.each do |dog|
      @dog_locations += dog.latitude.to_s + "," + dog.longitude.to_s + "%7C"
    end
  end

  def dashboard
    @user = current_user
    user_id = current_user.id
    @dogs = Dog.where(user_id: user_id)
    # @messages = @user.messages
  end
end
