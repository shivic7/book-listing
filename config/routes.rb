Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/get-book-list"=>'homepage#index'
  match "/show-book/:book_id"=>'homepage#show_book_details', via: [:get, :post], as: :show_book
end
