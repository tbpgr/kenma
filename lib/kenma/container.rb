# encoding: utf-8

module Kenma
  # Container
  class Container
    class << self
      attr_accessor :questions, :answers, :feedbacks

      def bundle
        ::Bundler.require(:default)
      rescue ::Bundler::GemfileNotFound
      end

      def questions
        @questions ||= []
      end

      def questions_with_id
        @questions.sort_by { |e|e.title }
                  .map!.with_index(1) { |e, i|
                    e.id = i
                    e
                  }
      end

      def answers
        @answers ||= []
      end

      def find_question_by_id(id)
        question = questions_with_id.find { |e|e.id == id.to_i }
        fail Kenma::Errors::NotExistError, "Not exist. Invalid question id (#{id}). " if question.nil?
        question
      end

      def find_answer_by_id(id)
        question = find_question_by_id(id)
        basename = question.name.gsub(/Question/, 'Answer')
        @answers.find { |e|e.name == basename }
      end

      def find_feedback_by_id(id)
        question = find_question_by_id(id)
        basename = question.name.gsub(/Question/, 'Feedback')
        @feedbacks.find { |e|e.name == basename }
      end

      def feedbacks
        @feedbacks ||= []
      end
    end
  end
end
