class HomeController < ApplicationController
  def index
      set_meta_tags site: 'Home page'
      @homePage = true
    end
  end
