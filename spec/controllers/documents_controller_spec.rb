require 'rails_helper'
require 'spec_helper'

RSpec.describe DocumentsController, type: :controller do
  before do
    user = FactoryBot.create(:user)
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end
 
  describe "GET #index" do
    # тест проверяет что возвращается корретный запрос
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end