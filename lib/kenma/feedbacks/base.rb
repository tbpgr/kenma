module Kenma
  module Feedbacks
    # Feedbacks::Base
    class Base
      # rubocop:disable Style/TrivialAccessors
      class << self
        attr_reader :feedback

        def inherited(child)
          ::Kenma::Container.feedbacks << child
        end

        def f(feedback)
          @feedback = feedback
        end
      end
      # rubocop:enable Style/TrivialAccessors
    end
  end
end
