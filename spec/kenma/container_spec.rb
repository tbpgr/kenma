# encoding: utf-8
require 'spec_helper'
require 'kenma/container'

describe Kenma::Container do
  context :questions do
    let(:dummy) do
      class Dummy
        class << self
          attr_accessor :id, :title
        end
      end
      Dummy.title = 'dummy'
      Dummy
    end

    cases = [
      {
        case_no: 1,
        case_title: 'normal case',
        expected: [Kenma::Questions::HelloWorldQuestion]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Kenma::Container.questions << dummy
          expected = c[:expected]
          expected << dummy

          # -- when --
          actual = Kenma::Container.questions

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        Kenma::Container.questions.delete(dummy)
      end
    end
  end

  context :questions_with_id do
    let(:dummy) do
      class Dummy
        class << self
          attr_accessor :id, :title
        end
      end
      Dummy.title = 'dummy'
      Dummy
    end

    cases = [
      {
        case_no: 1,
        case_title: 'normal case',
        expected: [Kenma::Questions::HelloWorldQuestion]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Kenma::Container.questions << dummy
          expected = c[:expected]
          expected << dummy

          # -- when --
          actual = Kenma::Container.questions_with_id

          # -- then --
          expect(actual).to eq(expected)
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        Kenma::Container.questions.delete(dummy)
      end
    end
  end

  context :find_answer_by_id do
    let(:dummy_question) do
      class DummyQuestion
        class << self
          attr_accessor :id, :title
        end
      end
      DummyQuestion.title = 'dummy question'
      DummyQuestion
    end

    let(:dummy_answer) do
      class DummyAnswer
        class << self
          attr_accessor :template, :expected
        end
      end
      DummyAnswer.template = 'dummy answer template'
      DummyAnswer.expected = 'dummy answer expected'
      DummyAnswer
    end

    cases = [
      {
        case_no: 1,
        case_title: 'normal case',
        expected: Kenma::Answers::HelloWorldAnswer
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Kenma::Container.questions << dummy_question
          Kenma::Container.answers << dummy_answer

          # -- when --
          actual = Kenma::Container.find_answer_by_id(1)

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        Kenma::Container.questions.delete(dummy_question)
        Kenma::Container.answers.delete(dummy_answer)
      end
    end
  end

  context :answers do
    cases = [
      {
        case_no: 1,
        case_title: 'normal case',
        expected: [Kenma::Answers::HelloWorldAnswer, String]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Kenma::Container.answers << String

          # -- when --
          actual = Kenma::Container.answers

          # -- then --
          expect(actual).to eq(c[:expected])
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

  context :feedbacks do
    cases = [
      {
        case_no: 1,
        case_title: 'normal case',
        expected: [Kenma::Feedbacks::HelloWorldFeedback, String]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Kenma::Container.feedbacks << String

          # -- when --
          actual = Kenma::Container.feedbacks

          # -- then --
          expect(actual).to eq(c[:expected])
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
