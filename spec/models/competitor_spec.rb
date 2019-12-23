# frozen_string_literal: true

# == Schema Information
#
# Table name: competitors
#
#  id         :bigint           not null, primary key
#  age        :integer
#  height     :integer
#  name       :string
#  sex        :integer
#  weight     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :bigint
#
# Indexes
#
#  index_competitors_on_team_id  (team_id)
#

require 'rails_helper'

RSpec.describe Competitor, type: :model do
  it "has a valid factory" do
    expect(build(:competitor)).to be_valid
  end

  describe 'associations' do
    let(:competitor) { build(:competitor) }

    it { is_expected.to belong_to(:team) }
    it { is_expected.to have_many(:competitor_sports) }
    it { is_expected.to have_many(:sports).through(:competitor_sports) }
    it { is_expected.to have_many(:competitor_events) }
    it { is_expected.to have_many(:events).through(:competitor_events) }
    it { is_expected.to define_enum_for(:sex) }
  end

  describe 'instance methods' do
    it '#total_medal_count' do
      comp1, comp2 = create_list(:competitor, 3)

      create_list(:competitor_event_with_medal, 5, competitor: comp1)
      create_list(:competitor_event_without_medal, 2, competitor: comp2)
      create_list(:competitor_event_with_medal, 2, competitor: comp1)

      expect(comp1.total_medal_count).to eq(7)
      expect(comp2.total_medal_count).to eq(2)
    end
  end
end
