# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SendMessageJob, type: :job do
  include ActiveJob::TestHelper

  let(:message) { FactoryBot.create(:message) }
  subject(:job) { described_class.perform_later(message) }


  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'broadcasts on the channel' do
    perform_enqueued_jobs do
      expect_any_instance_of(ActionCable::Server::Base).to receive(:broadcast)
      job
    end
  end
end
