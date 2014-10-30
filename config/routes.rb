Rails.application.routes.draw do
  devise_for :operators, path: "operadores", path_names: { sign_in: 'inicio',
    sign_out: 'salir'}, only: :session

  devise_scope :operator do
    get "operadores/editar", to: "devise/registrations#edit", as: "edit_operator_registration"
    patch "operadores", to: "devise/registrations#update", as: "operator_registration"
    put "operadores", to: "devise/registrations#update"
  end

  #Rutas en Español
  get 'graduados', to: 'graduates#index', as: :graduates

  get 'graduados/carga', to: 'graduates#upload', as: :graduates_upload
  post 'graduados/carga', to: 'graduates#do_upload'

  resources :juras, as: 'swears', controller: "swears",
    path_names: { new: 'nueva', edit: 'edicion' },
    except: [:destroy]

  resources :inscripciones, as: 'inscriptions', controller: "inscriptions",
    only: [:new,:create,:show], path_names: { new: 'nueva'} do

    collection do
      get 'verificar', as: :verify, action: "verify"
      post 'nueva', action: "new"
    end

  end

  post "juras/:id", to: 'swears#show'
  post "inscripciones/:id", to: 'inscriptions#show'

  root 'inscriptions#index'
end
