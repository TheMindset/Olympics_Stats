# frozen_string_literal: true

# == Schema Information
#
# Table name: sports
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Sport, type: :model do
  it "has a valid factory" do
    expect(build(:sport)).to be_valid
  end
end
