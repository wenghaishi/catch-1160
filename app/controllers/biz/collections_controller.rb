class Biz::CollectionsController < BizController
  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.business_id = params[:business_id].to_i

    if @collection.save
      redirect_to biz_business_collection_token_path(@collection.id), notice: "Collection created successfully."
    else
      render :new
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :description, :category)
  end

end