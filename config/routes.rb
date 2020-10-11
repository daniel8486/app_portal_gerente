Rails.application.routes.draw do
  namespace :pages do
    get 'acomp_ponto/index'
    post 'acomp_ponto/index'
  end
  namespace :pages do
    get 'acomp_func/index'
    post 'acomp_func/index'
  end
  namespace :pages do
    get 'aprovar_batida/index'
  end
  namespace :pages do
    get 'user/index'
    resources :users
  end
  namespace :pages do
    get 'payment/index'
    post 'payment/index'
  end
  namespace :pages do
    get 'money/index'
    post 'money/index'
  end
  namespace :pages do
    get 'points/index'
    post 'points/index'
  end
  namespace :pages do
    get 'point/index'
    post 'point/index'
  end
  namespace :pages do
    get 'dice/index'
  end
  namespace :pages do
    get 'welcome/index'
    get 'welcome/destroy'
    delete 'welcome/destroy'
  end
  namespace :users_office do
    get 'login/index'
    post 'login/index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'users_office/login#index'
end
