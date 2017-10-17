module ProductsHelper
	def display_image_for_product(product)
		img_url = product.img_url
		img_url.present? ? image_tag(img_url) : "No image."
	end
end
