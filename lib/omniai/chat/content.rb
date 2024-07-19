# frozen_string_literal: true

module OmniAI
  class Chat
    # A placeholder for parts of a message. Any subclass must implement the serializable interface.
    class Content
      # @return [String]
      def self.summarize(content)
        return content.map { |entry| summarize(entry) }.join("\n\n") if content.is_a?(Array)
        return content if content.is_a?(String)

        content.summarize
      end

      # @param context [Context] optional
      #
      # @return [String]
      def serialize(context: nil)
        raise NotImplementedError, ' # {self.class}#serialize undefined'
      end

      # @param data [hash]
      # @param context [Context] optional
      #
      # @return [Content]
      def self.deserialize(data, context: nil)
        raise ArgumentError, "untyped data=#{data.inspect}" unless data.key?('type')

        case data['type']
        when 'text' then Text.deserialize(data, context:)
        when /(.*)_url/ then URL.deserialize(data, context:)
        else raise ArgumentError, "unknown type=#{data['type'].inspect}"
        end
      end
    end
  end
end
