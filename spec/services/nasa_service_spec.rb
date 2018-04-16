require "rails_helper"

describe NasaService do
  describe "instance methods" do
    let(:service) { NasaService.new }
    it "get_asteroids_within_dates" do
      results = service.get_asteroids_within_dates(start_date: "2018-01-01", end_date: "2018-01-04")

      expect(results).to be_a Hash
      expect(results[:near_earth_objects]).to be_a Hash
      expect(results[:near_earth_objects].count).to be 4
      expect(results[:near_earth_objects].keys.first.to_s).to eq("2018-01-04")
      expect(results[:near_earth_objects][:"2018-01-04"][0][:name]).to be_a String
      expect(results[:near_earth_objects][:"2018-01-04"][0][:neo_reference_id]).to be_a String
      expect(results[:near_earth_objects][:"2018-01-04"][0][:is_potentially_hazardous_asteroid]).to be false
    end

  end
end
