class PagesController < ApplicationController
  def about
    @title = "About us"
    @content = "Welcome to Awesome blog about page. Here you will find everything about us"
  end
end
