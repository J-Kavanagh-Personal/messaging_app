# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoomChannel, type: :channel do

    it 'succeeds' do
      subscribe
      expect(subscription).to have_stream_from("RoomChannel")
    end
end
