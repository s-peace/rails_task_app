require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      # make userA
      user_a = FactoryBot.create(:user, name: 'ユーザーＡ', email: 'a@example.com')
      # make task of userA
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
    end

    context 'ユーザーＡがログインしているとき' do
      before do
        # login as userA
        visit login_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザーＡが作成したタスクが表示される' do
        # view task
        expect(page).to have_content '最初のタスク'
      end
    end
  end
end