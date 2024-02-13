# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageComponent, type: :component do


  let(:user) { FactoryBot.build(:user) }
  let(:message) { FactoryBot.build(:message)}


  it 'renders component' do
    render_inline(described_class.new(message: message, user: user))


    expect(page).to have_text "my title"
    expect(page).to have_text "#{user.email}"
  end
end
