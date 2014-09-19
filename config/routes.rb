Testapp::Application.routes.draw do
	root :to => 'blogs#index'

	resources :users

	get 		'/blogs', to: 'blogs#index'
	get 		'/blogs_all', to: 'blogs#index_all', format: :json

end
