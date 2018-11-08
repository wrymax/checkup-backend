Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#welcome'

  scope module: 'api' do
    namespace :v1 do
      resources :questionnaire_submissions, param: :digest_key do
        member do
          post :submit
        end
      end
    end
  end
end
