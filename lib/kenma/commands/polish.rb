# encoding: utf-8

module Kenma
  module Commands
    class Polish
      PROMPT = "> "
      def self.run(id)
        question = Kenma::Container.questions_with_id.find { |e|e.id == id}
        puts <<-EOS
id: #{question.id}
title: #{question.title}

description: #{question.description}
        EOS
        answer = Readline.readline(PROMPT, true)
        Kenma::Answers::HelloWorldAnswer.correct?(answer) ? puts("ok!") : puts("ng!")
      end
    end
  end
end
