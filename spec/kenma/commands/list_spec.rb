# encoding: utf-8
require "spec_helper"

describe Kenma::Commands::List do
  context :run do
    let(:dummy) do
      module Kenma
        module Questions
          class Dummy < ::Kenma::Questions::Base
            q(
              'hoge', <<-EOS
hoge1
hoge2
              EOS
            )
          end
        end
      end
      Kenma::Questions::Dummy
    end
    cases = [
      {
        case_no: 1,
        case_title: "normal case",
        expected: "1\tHello, world!\n2\thoge\n"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          out = StringIO.new
          $stdout = out
          dummy

          # -- when --
          Kenma::Commands::List.run
          actual = $stdout.string

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after(c, dummy)
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c, dummy)
        $stdout = STDOUT
        Kenma::Container.questions.delete(dummy)
      end
    end
  end
end
