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
    it 'imports users from CSV' do
      expect(User.count).to eq(0)
      post '/users/import', params: { file: csv_file }, xhr: true

      expect(assigns(:results)).to eq(JSON.parse(file_fixture('import_users_result.json').read))
      expect(response).to have_http_status(200)
      expect(User.count).to eq(1)
    end
  end
end
