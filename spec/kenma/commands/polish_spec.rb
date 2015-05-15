# encoding: utf-8
require "spec_helper"
require "kenma/commands/polish"

describe Kenma::Commands::Polish do
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
        case_title: "ok case",
        id: 1,
        answer: 'print',
        expected: <<-EOS
id: 1
title: Hello, world!

description: <空欄1> 'Hello, world!'
# => Hello, world!
空欄1 のコードを埋め 'Hello, world!' を標準出力してください。
※改行は出力しないでください。

ok!
        EOS
      },
      {
        case_no: 2,
        case_title: "ng case",
        id: 1,
        answer: 'invalid',
        expected: <<-EOS
id: 1
title: Hello, world!

description: <空欄1> 'Hello, world!'
# => Hello, world!
空欄1 のコードを埋め 'Hello, world!' を標準出力してください。
※改行は出力しないでください。

ng!
        EOS
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          out = StringIO.new
          allow(Readline).to receive(:readline).and_return(c[:answer])

          # -- when --
          Kenma::Commands::Polish.run(c[:id])

          # -- then --
          expect(true).to eq(true)
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        Kenma::Container.questions.delete(dummy)
      end
    end
  end
end
