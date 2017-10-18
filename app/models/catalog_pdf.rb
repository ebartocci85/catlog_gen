require "render_anywhere"

class CatalogPdf
  include RenderAnywhere

  def initialize(products)
    @products = products
  end

  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'Letter')
    kit.to_file("#{Rails.root}/tmp/#{filename}")
  end

  def filename
    "Catalog #{Time.now.to_i}.pdf"
  end

  private

    attr_reader :products

    def as_html
      render template: "products/pdf", layout: "pdf", locals: { products: products }
    end
end
