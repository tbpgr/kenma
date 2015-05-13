# encoding: utf-8
require 'spec_helper'

describe Kenma::Answers::HelloWorldAnswer do
  context :check_answer do
    cases = [
      {
        case_no: 1,
        case_title: 'correct case',
        answer: 'print',
        expected: true
      },
      {
        case_no: 2,
        case_title: 'correct case',
        answer: '$><<',
        expected: true
      },
      {
        case_no: 3,
        case_title: 'incorrect case',
        answer: 'puts',
        expected: false
      },
      {
        case_no: 4,
        case_title: 'incorrect(error) case',
        answer: 'invalid',
        expected: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          hello_world = Kenma::Answers::HelloWorldAnswer.correct?(c[:answer])

          # -- then --
          expect(hello_world).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        # implement each case after
      end
    end
  end
end
