class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  require 'csv'

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
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

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
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

  def generate_catalog
    send_catalog_pdf
  end

  def csv_export
  end

  def csv_export_all
    @products = Product.all
  end

def self.import(file)
  # content
end

  def import
      Product.import(params[:file])
      redirect_to root_url, notice: "Products imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:upc, :sku, :brand, :size, :currency, :retail, :wholesale, :img_url)
    end

    def catalog_upc_codes
      [
        "753048655212", "753048576067", "753048655052", "753048736140",
        "753048643981", "753048643998", "753048688609", "753048620425",
        "753048643967", "753048655168", "753048655175", "753048655199"
      ]
    end

    def catalog_pdf
      products = Product.where(upc: catalog_upc_codes).limit(12)
      CatalogPdf.new(products)
    end

    def send_catalog_pdf
      send_file catalog_pdf.to_pdf,
        filename: catalog_pdf.filename,
        type: "application/pdf",
        disposition: "inline"
    end
end
