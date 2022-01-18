require 'rails_helper'

describe "Home", type: :request do
  let(:user) { create(:user) }

  # no test abaixo espera receber a mesma message do controller home
  it "Test Home" do
    get '/admin/v1/home', headers: auth_header(user)
    expect(body_json).to eq({'message' => 'uhul!'})
  end

  # no test abaixo espera receber o status http 200 que é  simbolizado pelo ok
  it "Test Home" do
    get '/admin/v1/home', headers: auth_header(user)
    expect(response).to have_http_status(:ok)
  end
end