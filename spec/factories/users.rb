# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 10 }
    email { 'example@example.com' }
    password { 'password123' }
  end
end