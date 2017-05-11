class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :registration_choice ]

  def home
    @dogs = Dog.all
    @dog_locations = ""
    @dogs.each do |dog|
      @dog_locations += dog.latitude.to_s + "," + dog.longitude.to_s + "%7C"
    end

    @markers = Gmaps4rails.build_markers(@dogs) do |dog, marker|
      marker.lat dog.latitude
      marker.lng dog.longitude

      marker.picture({
          :url => "http://chart.apis.google.com/chart?chst=d_map_pin_icon&chld=glyphish_dogpaw|96b976",
          :width   => 32,
          :height  => 32
       })
    end
  end

  def dashboard
    @user = current_user
    user_id = current_user.id
    @dogs = Dog.where(user_id: user_id)
    # @messages = @user.messages
  end
end
