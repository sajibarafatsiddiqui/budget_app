require 'rails_helper'

RSpec.describe 'Deals', type: :feature do
  let(:user) { User.create(name: 'Test', email: 'test@example.com', password: 'password') }
  let!(:category1) { Category.create(Name: 'Test1', icon: fixture_file_upload('test.png', 'image/png'), user:) }
  let!(:category2) { Category.create(Name: 'Test2',icon: fixture_file_upload('test.png', 'image/png'), user:) }
  let!(:payment1) {Deal.create(name: 'Test1', amount: 10, author: user) }
  let!(:payment2) { Deal.create(name: 'Test2', amount: 20, author: user) }

  before do
    category1.deals << payment1
    category2.deals << payment2
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    visit category_path(category1)
  end

  scenario 'displays a list of payments with their categories' do
   

    expect(page).to have_content('Test1')
    expect(page).to have_content('$10.0')
  end
end
