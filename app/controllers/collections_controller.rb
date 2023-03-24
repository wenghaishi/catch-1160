class CollectionsController < UserController
  def show
    @collection = Collection.find(params[:id])
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :description, :category)
  end
end
