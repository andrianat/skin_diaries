class NeedsController < ApplicationController
  def index
    @q = Need.ransack(params[:q])
    @needs = @q.result(:distinct => true).includes(:favorites, :products).page(params[:page]).per(10)

    render("needs/index.html.erb")
  end

  def show
    @favorite = Favorite.new
    @need = Need.find(params[:id])

    render("needs/show.html.erb")
  end

  def new
    @need = Need.new

    render("needs/new.html.erb")
  end

  def create
    @need = Need.new

    @need.need_type = params[:need_type]

    save_status = @need.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/needs/new", "/create_need"
        redirect_to("/needs")
      else
        redirect_back(:fallback_location => "/", :notice => "Need created successfully.")
      end
    else
      render("needs/new.html.erb")
    end
  end

  def edit
    @need = Need.find(params[:id])

    render("needs/edit.html.erb")
  end

  def update
    @need = Need.find(params[:id])

    @need.need_type = params[:need_type]

    save_status = @need.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/needs/#{@need.id}/edit", "/update_need"
        redirect_to("/needs/#{@need.id}", :notice => "Need updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Need updated successfully.")
      end
    else
      render("needs/edit.html.erb")
    end
  end

  def destroy
    @need = Need.find(params[:id])

    @need.destroy

    if URI(request.referer).path == "/needs/#{@need.id}"
      redirect_to("/", :notice => "Need deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Need deleted.")
    end
  end
end
