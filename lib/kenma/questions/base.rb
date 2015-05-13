module Kenma
  module Questions
    # Questions::Base
    class Base
      class << self
        attr_accessor :id
        attr_reader :title, :description

        def inherited(child)
          ::Kenma::Container.questions << child
        end

        def q(title, description)
          @title = title
          @description = description
        end
      end
    end
  end
end
