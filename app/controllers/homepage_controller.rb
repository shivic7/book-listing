class HomepageController < ApplicationController
	def index
		begin
			@result = JSON RestClient::Request.execute({method: :get,url: "https://www.googleapis.com/books/v1/volumes?filter=free-ebooks&q=a"})
		rescue Exception => e
			@result = []
		end		
	end

	def show_book_details
		if params["image_link"].blank?
			result = JSON RestClient::Request.execute({method: :get,url: "https://www.googleapis.com/books/v1/volumes?filter=free-ebooks&q=a"})
			result = result["items"].select{|a| a["id"] == params["book_id"]}.last
			if result.present?
				params["image_link"] = result["volumeInfo"]["imageLinks"]["thumbnail"]
				params["subtitle"] = result["volumeInfo"]["subtitle"]
			end
		end
	end

end
