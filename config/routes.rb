Rails.application.routes.draw do
  devise_for :operators, path: "operadores", path_names: { sign_in: 'inicio', sign_out: 'salir'}

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
