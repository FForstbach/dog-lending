class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :registration_choice ]

  def home
  end

  def dashboard
  end
end
