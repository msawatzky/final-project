class PagesController < ApplicationController
  def about
    @page = Page.find_by code: 'ABT'
  end

  def contact
    @page = Page.find_by code: 'CTC'
  end
end
