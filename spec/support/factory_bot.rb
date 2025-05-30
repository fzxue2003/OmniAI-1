# frozen_string_literal: true

require "factory_bot"

FactoryBot.find_definitions

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
