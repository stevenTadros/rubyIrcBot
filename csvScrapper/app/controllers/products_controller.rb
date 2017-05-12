class ProductsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if params[:search]
      @products = Product.search(params[:search]).order("\"#{sort_column}\" #{sort_direction}")
    else
      @products = Product.order("\"#{sort_column}\" #{sort_direction}")
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  def import
    if params[:file].present?
      Product.import(params[:file])
      redirect_to root_url, notice: "CSV successfully imported" 
    else
      redirect_to root_url, notice: "Please choose a file" 
    end 
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:EAN, :MARQUE, :REF_FABRICANT, :CATEGORIES, :NOM_PRODUIT)
    end

    private
    def sortable_columns
      ["EAN", "MARQUE", "REF_FABRICANT", "CATEGORIES", "NOM_PRODUIT"]
    end

    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "EAN"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    
  end