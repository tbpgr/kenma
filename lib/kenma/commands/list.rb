# encoding: utf-8

module Kenma
  module Commands
    class List
      def self.run
        puts Kenma::Container.questions_with_id.map { |e|"#{e.id}\t#{e.title}" }
      end
    end
  end
end
