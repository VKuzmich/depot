# frozen_string_literal: true

FactoryBot.define do

  factory :product do |f|
    f.title { FFaker::Name.unique.first_name }
    f.description { 'very good'}
    f.image_url { 'fit.png' }
    f.price { 24 }
  end
end