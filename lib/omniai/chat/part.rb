# frozen_string_literal: true

module OmniAI
  class Chat
    # Either a delta or message.
    class Part < OmniAI::Chat::Response::Resource
      # @return [String]
      def inspect
        "#<#{self.class.name} role=#{role.inspect} content=#{content.inspect}>"
      end

      # @return [String]
      def role
        @data['role'] || Role::USER
      end

      # @return [String, nil]
      def content
        @data['content']
      end

      # @return [Array<OmniAI::Chat::Response::ToolCall>]
      def tool_call_list
        return [] unless @data['tool_calls']

        @tool_call_list ||= @data['tool_calls'].map do |tool_call_data|
          Response::ToolCall.new(data: tool_call_data)
        end
      end
    end
  end
end
