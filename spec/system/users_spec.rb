require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do

  # 一旦保留
  # it 'ログインに成功し、トップページに遷移する' do
  #   # 予め、ユーザーをDBに保存する
  #   @user = FactoryBot.create(:user)
  #   # サインインページへ移動する
  #   binding.pry
  #   visit new_user_session_path
   
  #   # ログインしていない場合、サインインページに遷移していることを確認する
  #   expect(page).to have_current_path(new_user_session_path)
  #   # すでに保存されているユーザーのemailとpasswordを入力する
  #   fill_in 'email', with: @user.email
  #   fill_in 'password', with: @user.password
  #   # ログインボタンをクリックする
  #   click_on('ログイン') 
  #   sleep 1
  #   # トップページに遷移していることを確認する
  #   expect(page).to have_current_path(root_path)
  # end

end
