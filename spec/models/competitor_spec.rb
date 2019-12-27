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
    let(:comp2) { create(:competitor, sex: 'F', age: 18, height: 159, weight: 61) }
    let(:comp1) { create(:competitor, sex: 'M', age: 35, height: 181, weight: 75) }
    let!(:youngest) { create(:competitor, sex: 'F', age: 15, height: 162, weight: 55) }
    let!(:oldest) { create(:competitor, sex: 'M', age: 45, height: 174, weight: 69) }

    before do
      create(:competitor, sex: 'F', age: 27, height: 162, weight: 65)
      create(:competitor, sex: 'M', age: 18, height: 174, weight: 69)
      create(:competitor, sex: 'F', age: 16, height: 159, weight: 57)
      create(:competitor, sex: 'F', age: 26, height: 174, weight: 61)
      create(:competitor, sex: 'F', age: 31, height: 179, weight: 63)

      create_list(:competitor_event_with_medal, 5, competitor: comp1)
      create_list(:competitor_event_with_medal, 2, competitor: comp2)
    end

    it '#total_medal_count' do
      expect(comp1.total_medal_count).to eq(5)
      expect(comp2.total_medal_count).to eq(2)
    end

    it "#youngest competitor" do
      expect(described_class.youngest_competitor).to eq(youngest)
    end

    it "#oldest competitor" do
      expect(described_class.oldest_competitor).to eq(oldest)
    end

    it "#total_competitors" do
      expect(described_class.total_competitors).to eq(9)
    end

    it "#competitors_average" do
      expect(described_class.competitors_average("M", 'height').to_i).to eq(176)
      expect(described_class.competitors_average("F", "height").to_i).to eq(165)

      expect(described_class.competitors_average(["M", "F"], "age").to_i).to eq(25)

      expect(described_class.competitors_average("M", "weight").to_i).to eq(71)
      expect(described_class.competitors_average("F", "weight").to_i).to eq(60)
    end
  end
end
