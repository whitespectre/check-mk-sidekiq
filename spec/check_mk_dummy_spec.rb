require 'spec_helper'
require 'check_mk/agents/dummy_agent'

describe CheckMK::Agents::DummyAgent do
  before do
    allow(subject).to receive(:stats).and_return( {foo: 1, bar: 2} )
  end

  its(:name) { should eq('dummy_agent') }

  context '#initialize' do
    subject { CheckMK::Agents::DummyAgent.new(name: 'foobar') }
    its(:name) { should eq('foobar') }
  end

  context '#lines' do
    its('lines.count') { should eq 3 }
    its(:lines) { should include('<<<dummy_agent>>>') }
    its(:lines) { should include('foo 1') }
    its(:lines) { should include('bar 2') }
  end

  context '#output' do
    its(:output) { should match '<<<dummy_agent>>>' }
    its(:output) { should match 'foo 1' }
    its(:output) { should match 'bar 2' }
  end
end
