class Product < ApplicationRecord

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |product|
	      csv << product.attributes.values_at(*column_names)
	    end
	  end
	end


	def self.import(file, action)
	  products = [] #this will store all CSV parsed products
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|

		  row = Hash[[header, spreadsheet.row(i)].transpose]
	    product = find_by_id(row["id"]) || new
	  #  product.attributes = row.to_hash.slice("upc","sku","brand","size", "currency", "retail",
		product.upc = row.to_hash["UPC"].to_i
		product.sku = row.to_hash["SKU"]
		product.brand = row.to_hash["BRAND"]
		product.size = row.to_hash["SIZE"]
		product.currency = row.to_hash["CURRENCY"]
		product.retail = row.to_hash["RETAIL"]
		product.wholesale = row.to_hash["WHOLESALE"]
		product.img_url = row.to_hash["IMG_URL"]
		product.collection = row.to_hash["COLLECTION"]

		products << product
	  end

	  if action == "save"
	  	products.map(&:save!)
	  else
	  	return  products
	  end

	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
	  when ".xls" then Roo::Excel.new(file.path)
	  when ".xlsx" then Roo::Excelx.new(file.path)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end
end
