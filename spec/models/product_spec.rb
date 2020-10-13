

# frozen_string_literal: true

require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:image_url) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.01)}
    it { should allow_value('2.jpg').for(:image_url) }
    it { should allow_value('2.png').for(:image_url) }
    it { should allow_value('2.gif').for(:image_url) }
    it {
      should_not allow_value('2.ggr')
        .for(:image_url)
        .with_message('must be a URL for GIF, JPG or PNG image.')

    }

  end
end