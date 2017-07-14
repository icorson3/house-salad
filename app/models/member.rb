class Member
  attr_reader :name, :role, :party, :district, :seniority

  def initialize(attrs = {})
    @name = attrs[:name]
    @role = attrs[:role]
    @party = attrs[:party]
    @district = attrs[:district]
    @seniority = attrs[:seniority].to_i
  end

  def self.find_all(state)
    members = PropublicaService.find_house_members(state).map do |raw_member|
      Member.new(raw_member)
    end
    sort_members(members)
  end

  def self.sort_members(members)
    members.sort_by { |member| member.seniority }.reverse
  end
end
