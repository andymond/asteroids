require "rails_helper"

describe "favorites api" do
  it "allows user to add an asteroid to their favorites" do
    user = create(:user)
    user.create_api_key(value: "abc123")
    fav = user.favorites.create(neo_reference_id: "2153306")

    post "/api/v1/user/favorites?api_key=abc123&neo_reference_id=2021277"

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to be_a Hash
    expect(results[:id]).to eq(fav.id + 1)
    expect(results[:neo_reference_id]).to eq("2021277")
    expect(results[:user_id]).to eq(user.id)
    expect(results[:asteroid]).to be_a Hash
    expect(results[:asteroid][:name]).to eq("21277 (1996 TO5)")
    expect(results[:asteroid][:is_potentially_hazardous_asteroid]).to eq(false)
  end
end
