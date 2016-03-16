class Backend::CatalogsController <  Backend::BaseController
  
  def index
    @catalogs = Catalog.all.order("id desc").page(params[:page]).per(20)
  end

  def new
    @catalog = Catalog.new
  end

  def create
    @catalog = Catalog.new(catalog_params)
    if @catalog.save
      redirect_to backend_catalogs_path(:back => request.fullpath)
   else
     render "new"
    end
  end

  def edit
    @catalog = Catalog.find(params[:id])
  end

 
  def update
    catalog = Catalog.find(params[:id])
    if catalog.update_attributes(catalog_params)
      flash[:success] = '更新成功!'
      @catalogs = Catalog.all
      render 'index'
    else
      flash[:error] = '更新失败!'
      redirect_to :back
    end
  end

  # before_filter  do
  #   binding.pry
  # end


  def destroy
    @catalog = Catalog.find(params[:id])
    @catalog.destroy
     redirect_to  backend_catalogs_path
  end

 def show
    @catalog = Catalog.find(params[:id])
  end

  private
    def catalog_params
      params.require(:catalog).permit(:name, :desc)
    end

end

