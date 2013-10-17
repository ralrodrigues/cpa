Cpa::Application.routes.draw do
    
  resources :questionarios do
    
    resources :graficos

    post :iniciar_votacao, :encerrar_votacao
    
    get 'configuracoes', on: :collection
    get 'encerrados',    on: :collection
    
    resources :modelos, shallow: true do
      get 'docente', on: :collection
      get 'discente', on: :collection
      get 'tae', on: :collection    
      resources :topicos, shallow: true do
        resources :perguntas, shallow: true do
          resources :respostas, shallow: true do
            resources :usuarios
          end
        end  
      end
    end

    resources :areas, shallow: true do
      get 'votacao', on: :collection
      delete 'destroy_multiple', on: :collection
      resources :funcionarios, shallow: true do 
        delete 'destroy_multiple', on: :collection
      end          
    end
    get 'coordenadores' => 'areas#coordenadores'

    resources :cursos, shallow: true do
      get 'votacao', on: :collection
      delete 'destroy_multiple', on: :collection
      post 'duplicate'
      resources :disciplinas, shallow: true do
        delete 'destroy_multiple', on: :collection
        resources :turmas, shallow: true do
        end
      end
    end


    # # rotas do wizard prepracao de questionários
    # # dominio/questionarios/1/preparacao/funcionario/
    # get 'preparacao/areas'
    # # esta rota deve ter um checkbox para ligar o coordenador a area
    # get 'preparacao/funcionarios'
    # get 'preparacao/cursos'
    # # esta rota deve se cadastrar as turmas
    # get 'preparacao/disciplinas'
    # get 'preparacao/modelos'
    # # esta rota deve se as perguntas aos topicos
    # get 'preparacao/topicos'
  end
  
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
