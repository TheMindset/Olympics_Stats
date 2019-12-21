# frozen_string_literal: true

# == Schema Information
#
# Table name: competitors
#
#  id         :bigint           not null, primary key
#  age        :integer
#  height     :integer
#  name       :string
#  sex        :string
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
  # TODO: failed
  # it "has a valid factory" do
  #   expect(build(:competitor)).to be_valid
  # end

  describe 'associations' do
    let(:competitor) { build(:competitor) }

    it { is_expected.to belong_to(:team) }
  end
end
