# encoding: utf-8
require 'spec_helper'

describe Kenma::Questions::HelloWorldQuestion do
  context :q do
    cases = [
      {
        case_no: 1,
        case_title: 'normal case',
        expected_title: 'Hello, world!',
        expected_description: <<-EOS
<空欄1> 'Hello, world!'
# => Hello, world!
空欄1 のコードを埋め 'Hello, world!' を標準出力してください。
※改行は出力しないでください。
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
          hello_world = Kenma::Questions::HelloWorldQuestion

          # -- then --
          expect(hello_world.title).to eq(c[:expected_title])
          expect(hello_world.description).to eq(c[:expected_description])
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
