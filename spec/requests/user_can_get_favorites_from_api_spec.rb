require "rails_helper"

describe "favorites_api" do
  it "returns favorite asteroids" do
    user = create(:user)
    user.create_api_key(value: "abc123")
    fav = user.favorites.create(neo_reference_id: "2153306")

    get '/api/v1/user/favorites?api_key=abc123'

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to be_an Array
    expect(results.first[:id]).to eq(fav.id)
    expect(results.first[:neo_reference_id]).to eq("2153306")
    expect(results.first[:user_id]).to eq(user.id)
    expect(results.first[:asteroid]).to be_a Hash
    expect(results.first[:asteroid][:name]).to eq("153306 (2001 JL1)")
    expect(results.first[:asteroid][:is_potentially_hazardous_asteroid]).to eq(false)
  end
end
