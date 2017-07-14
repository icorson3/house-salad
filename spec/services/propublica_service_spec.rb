require 'rails_helper'

describe PropublicaService do
  context "class methods" do
    context ".find_house_members" do
      it "has specific keys" do
        raw_members = PropublicaService.find_house_members("CO")
        first_member = raw_members.first

        expect(raw_members.count).to eq(7)
        expect(first_member).to have_key(:name)
        expect(first_member[:name]).to be_a(String)
        expect(first_member).to have_key(:role)
        expect(first_member[:role]).to be_a(String)
        expect(first_member).to have_key(:party)
        expect(first_member[:party]).to be_a(String)
        expect(first_member).to have_key(:district)
        expect(first_member[:district]).to be_a(String)
      end
    end
  end
end
