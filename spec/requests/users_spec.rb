require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/home' do
    it 'renders home page' do
      get '/users/home'
      expect(response).to render_template(:home)
    end
  end

  describe 'POST /users/import' do
    let(:csv_file) { fixture_file_upload(file_fixture('import_users.csv')) }
    it do
      expect(User.count).to eq(0)
      post '/users/import', params: { file: csv_file }, xhr: true

      expect(assigns(:results)).to eq(['Change 4 characters of user1\'s password', 'Change 2 characters of user2\'s password', 'user3 was successfully saved', 'Change 1 characters of user4\'s password', 'Name can\'t be blank, Change 6 characters of \'s password'])
      expect(response).to have_http_status(200)
      expect(User.count).to eq(1)
    end
  end
end
