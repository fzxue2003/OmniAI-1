# frozen_string_literal: true

RSpec.describe OmniAI::Client do
  subject(:client) { described_class.new(api_key:) }

  let(:api_key) { 'abcdef' }

  describe '#api_key' do
    it { expect(client.api_key).to eq(api_key) }
  end

  describe '#connection' do
    it { expect { client.connection }.to raise_error(NotImplementedError) }
  end

  describe '#chat' do
    it { expect { client.chat('Hello!', model: '...') }.to raise_error(NotImplementedError) }
  end

  describe '#inspect' do
    it { expect(client.inspect).to eq('#<OmniAI::Client api_key="abc***">') }
  end
end
