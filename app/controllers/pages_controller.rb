class PagesController < ApplicationController

  def index
    case params[:scope]
    when 'children', 'youth', 'elder', 'food', 'prison', 'hospital', 'sunday', 'tuesday', 'thursday', 'father', 'son', 'holy_spirit', 'contact', 'home', 'about_redeedemed', 'about_go', 'about_parish_pastor', 'about', 'fridaynightvigil', 'lunchhourprayer', 'generalnightvigil'
      @pages = Page.send(params[:scope])
    end

    # hash = { 'children' => 1, 'youth' => 1,}
    # if hash[params[:scope]] == 1
    #   @pages = Page.send(params[:scope])
    # end
  end

  private

  def page_params
    params.require(:page).permit(:body, :page_type, pictures_attributes: [:id, :page_id, :image])
  end
end
