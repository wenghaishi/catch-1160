class Biz::CollectionsController < BizController
  def new
    if params[:business_id].to_i != current_user.business.id
      redirect_to root_path,
                  alert: "You are not authorized to create a collection for this business."
    end

    @collection = Collection.new
  end

  def show
    @token = Token.new
    @collection = Collection.find(params[:id])
    @business = Business.find(params[:business_id])

    redirect_to root_path if @collection.business.user != current_user
  end

  def create
    if params[:business_id].to_i != current_user.business.id
      return render json: { error: "You are not authorized to create a collection for this business." },
                    status: :unauthorized
    end

    @collection = Collection.new(collection_params)
    @collection.business_id = params[:business_id].to_i
    if @collection.save
      redirect_to biz_business_collection_path(@collection.business_id, @collection),
                  notice: "Collection created successfully."
    else
      render :new
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :description, :category, :banner, :photo)
  end
end
