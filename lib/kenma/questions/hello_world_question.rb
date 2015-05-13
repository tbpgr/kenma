# encoding: utf-8

module Kenma
  module Questions
    # Questions::HelloWorldQuestion
    class HelloWorldQuestion < ::Kenma::Questions::Base
      q(
        'Hello, world!', <<-EOS
<空欄1> 'Hello, world!'
# => Hello, world!
空欄1 のコードを埋め 'Hello, world!' を標準出力してください。
※改行は出力しないでください。
        EOS
      )
    end
  end
end
