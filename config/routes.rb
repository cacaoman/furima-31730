Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#  Specified key was too long; max key length is 767 bytes
#  →utf8に変えましょう
# # rails db:rollback
# vsコードから直接マイグレーションファイルは消さない
# pendingmaigration →status(rails db:migrate:status)を確認しましょう
# →マイグレーションファイルが立ち上がっていない可能性がある
# itemsコントーラーを作成しましょう