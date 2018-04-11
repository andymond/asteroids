require "rails_helper"

describe "User visits root and enters start & end date" do
  it "displays most dangerous day between start & end dates" do
    create(:api_key)

    visit root_path

    fill_in "start_date", with: "2018-01-01"
    fill_in "end_date", with: "2018-01-07"
    find(".btn-outline").click

    expect(current_path).to eq("/most_dangerous_day")
    expect(page).to have_content("January 1, 2018 - January 7, 2018")
    expect(page).to have_css('.most-dangerous-header')
    expect(page).to have_css('.asteroid', count: 3)
    expect(page).to have_content("Name: (2014 KT76)")
    expect(page).to have_content("NEO Reference ID: 3672906")
    expect(page).to have_content("Name: (2001 LD)")
    expect(page).to have_content("NEO Reference ID: 3078262")
    expect(page).to have_content("Name: (2017 YR1)")
    expect(page).to have_content("NEO Reference ID: 3794979")
  end
end
