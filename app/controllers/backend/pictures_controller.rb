class Backend::PicturesController < ActionController::Base
layout 'spp'
before_filter :authenticate_user!
before_filter :find_picture
  def index
    @pictures = Picture.all	
  end

  def new
    @picture = Picture.new 	
  end

  def create
    @picture = Picture.new(picture_params)
     if @picture.save
      @picture.avatars.create(:photo => params[:photo])
      redirect_to backend_pictures_path(:back => request.fullpath)
    else
      render 'new'   	
    end
  end

  def edit

  end

  def update
    @picture.update_attributes(picture_params)
     if params[:photo]
         @picture.avatars.each do |ta|
          ta.update(:photo => params[:photo])
         end
     end  
    redirect_to backend_pictures_path(:back => request.fullpath) 

  end

  def destroy
    @picture.destroy
    redirect_to backend_pictures_path
  end
  private
  def find_picture
     @picture = Picture.find(params[:id]) if params[:id]
  end

  def picture_params
     params.require(:picture).permit(:name)
   end	
end