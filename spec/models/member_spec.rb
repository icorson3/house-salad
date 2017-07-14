require 'rails_helper'

describe Member do
  it "has all the attributes" do
    raw_member = {name: "Ilana", role: "Representative", party: "D", district: "1", seniority: "1"}

    member = Member.new(raw_member)


    expect(member.name).to eq("Ilana")
    expect(member.role).to eq("Representative")
    expect(member.party).to eq("D")
    expect(member.district).to eq("1")
  end

  it "returns members sorted" do
    raw_members = [{name: "Ilana", role: "Representative", party: "D", district: "1", seniority: "1"},
                   {name: "Josh", role: "Representative", party: "D", district: "1", seniority: "7"},
                   {name: "Ilana2", role: "Representative", party: "D", district: "1", seniority: "5"}
    ]

    allow_any_instance_of(PropublicaService).to receive(:find_house_members).and_return(raw_members)

    members = Member.find_all("CO")

    expect(members.first.name).to eq("Josh")
  end

end
