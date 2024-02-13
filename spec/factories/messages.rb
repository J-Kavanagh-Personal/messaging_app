# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    id { 10 }
    user { build(:user) }
    content { 'my title' }
    room { build(:room) }
  end
end