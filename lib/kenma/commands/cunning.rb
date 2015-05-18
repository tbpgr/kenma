# encoding: utf-8

module Kenma
  module Commands
    class Cunning
      def self.run(id)
        question = Kenma::Container.find_question_id(id)
        question_detail =<<-EOS
id: #{question.id}
title: #{question.title}

#{question.description}
        EOS
        print question_detail.chop
        feedback = Kenma::Container.find_feedback_by_id(id)
        puts
        print feedback.feedback
      end
    end
  end
end
