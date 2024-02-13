# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessagesController, type: :controller  do

  let(:user) { FactoryBot.create(:user) }
  let(:params) {
    {
      message: { content: "my title",
                 room_id: FactoryBot.create(:room).id,
                 user_id: user.id }
    }
  }

  before { allow(controller).to receive(:current_user) { user } }

  context 'POST create' do
    it 'increases number of messages' do
      expect { post :create, params: params }.to change(Message.all, :count).by(1)
    end
  end
end
