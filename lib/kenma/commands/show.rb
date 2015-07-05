# encoding: utf-8

module Kenma
  module Commands
    class Show
      def self.run(id)
        Kenma::Container.bundle
        question = Kenma::Container.find_question_by_id(id)
        question_detail =<<-EOS
id: #{question.id}
title: #{question.title}
description:
#{question.description}
        EOS
        print question_detail.chop
      end
    end
  end
end
