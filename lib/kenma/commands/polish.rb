# encoding: utf-8

module Kenma
  module Commands
    class Polish
      PROMPT = "> "
      def self.run(id)
        Kenma::Container.bundle
        question = Kenma::Container.questions_with_id.find { |e|e.id == id.to_i }
        fail Kenma::Errors::NotExistError, "Not exist. Invalid question id (#{id}). " if question.nil?
        puts <<-EOS
id: #{question.id}
title: #{question.title}

#{question.description}
        EOS
        input_answer = Readline.readline(PROMPT, true)
        answer = Kenma::Container.find_answer_by_id(id)
        answer.correct?(input_answer) ? puts("ok!") : puts("ng!")
      end
    end
  end
end
