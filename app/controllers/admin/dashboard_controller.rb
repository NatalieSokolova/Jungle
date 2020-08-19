class Admin::DashboardController < ApplicationController
  def show
  end
  
  http_basic_authenticate_with :name => ENV['username'], :password => ENV['password']
end
