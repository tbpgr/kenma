# encoding: utf-8
require "spec_helper"
require "kenma/commands/show"

describe Kenma::Commands::Show do
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
        id: 1,
        expected: <<-EOS
id: 1
title: Hello, world!
description:
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
          out = StringIO.new
          $stdout = out
          dummy

          # -- when --
          Kenma::Commands::Show.run(c[:id])
          actual = $stdout.string

          # -- then --
          expect(actual).to eq(c[:expected])
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
