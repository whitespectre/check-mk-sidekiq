require 'spec_helper'
require 'check_mk/agents/sidekiq'

class FakeSidekiq
  attr_reader :processed, :failed, :enqueued, :workers_size
  def initialize(args=nil)
    @processed = 1
    @failed = 2
    @enqueued = 3
    @workers_size = 5
  end
end

describe CheckMK::Agents::Sidekiq do
  before do
    allow(subject).to receive(:sidekiq_stats).and_return( FakeSidekiq.new )
  end

  its(:name) { should eq('sidekiq') }

  context '#lines' do
    its('lines.count') { should eq 5 }
    its(:lines) { should include('workers_size 5') }
    its(:lines) { should include('processed 1') }
    its(:lines) { should include('failed 2') }
    its(:lines) { should include('enqueued 3') }
  end

end
