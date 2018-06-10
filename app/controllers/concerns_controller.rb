class ConcernsController < ApplicationController
  def index
    @q = Concern.ransack(params[:q])
    @concerns = @q.result(:distinct => true).includes(:favorites, :products).page(params[:page]).per(10)

    render("concerns/index.html.erb")
  end

  def show
    @favorite = Favorite.new
    @concern = Concern.find(params[:id])

    render("concerns/show.html.erb")
  end

  def new
    @concern = Concern.new

    render("concerns/new.html.erb")
  end

  def create
    @concern = Concern.new


    save_status = @concern.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/concerns/new", "/create_concern"
        redirect_to("/concerns")
      else
        redirect_back(:fallback_location => "/", :notice => "Concern created successfully.")
      end
    else
      render("concerns/new.html.erb")
    end
  end

  def edit
    @concern = Concern.find(params[:id])

    render("concerns/edit.html.erb")
  end

  def update
    @concern = Concern.find(params[:id])


    save_status = @concern.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/concerns/#{@concern.id}/edit", "/update_concern"
        redirect_to("/concerns/#{@concern.id}", :notice => "Concern updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Concern updated successfully.")
      end
    else
      render("concerns/edit.html.erb")
    end
  end

  def destroy
    @concern = Concern.find(params[:id])

    @concern.destroy

    if URI(request.referer).path == "/concerns/#{@concern.id}"
      redirect_to("/", :notice => "Concern deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Concern deleted.")
    end
  end
end
