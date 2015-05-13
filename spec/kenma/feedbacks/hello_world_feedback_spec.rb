# encoding: utf-8
require 'spec_helper'
require 'kenma/feedbacks/hello_world_feedback'

describe Kenma::Feedbacks::HelloWorldFeedback do
  context :f do
    cases = [
      {
        case_no: 1,
        case_title: 'normal case',
        expected: <<-EOS
答えは print です。( $><< でも可 )
        EOS
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          hello_world = Kenma::Feedbacks::HelloWorldFeedback

          # -- then --
          expect(hello_world.feedback).to eq(c[:expected])
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
