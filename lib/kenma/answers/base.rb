module Kenma
  module Answers
    # Answers::Base
    class Base
      class << self
        attr_reader :template, :expected

        def inherited(child)
          ::Kenma::Container.answers << child
        end

        # rubocop:disable Style/LineLength
        def correct?(_answer)
          fail NotImplementedError, 'You must implement #{self.class}##{__method__}'
        end
        # rubocop:enable Style/LineLength

        def a(template, expected)
          @template = template
          @expected = expected
        end
      end
    end
  end
end
