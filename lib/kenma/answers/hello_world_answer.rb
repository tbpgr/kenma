# encoding: utf-8
require 'stringio'

module Kenma
  module Answers
    # Answers::HelloWorldAnswer
    class HelloWorldAnswer < ::Kenma::Answers::Base
      a(
        '$answer$ "Hello, world!"',
        'Hello, world!'
      )

      # rubocop:disable Lint/Eval
      def self.correct?(answer)
        out = ::StringIO.new
        out.set_encoding('utf-8')
        $stdout = out
        eval @template.gsub('$answer$', answer)
        actual = $stdout.string
        $stdout = STDOUT
        actual == @expected
      rescue => e
        puts e.message
        false
      ensure
        $stdout = STDOUT
      end
      # rubocop:enable Lint/Eval
    end
  end
end
