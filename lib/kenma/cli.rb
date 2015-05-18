require 'thor'
require 'active_support/inflector'
require 'enel'
require 'kenma/commands'
require 'kenma/errors'

module Kenma
  class CLI < ::Thor
    extend Enel
    class_option :help, type: :boolean, aliases: '-h', desc: 'help message.'
    class_option :version, type: :boolean, desc: 'version'

    desc 'list', 'list'
    def list
    end

    desc 'show [question id]', 'show'
    def show(question_id)
    end

    desc 'cunning [question id]', 'cunning'
    def cunning(question_id)
    end

    desc 'polish [question id]', 'polish'
    def polish(question_id)
    end

    define_call_command(proc { |*args|
      begin
        command = args.first.to_s.camelize
        params = args[1..-1]
        puts Object.const_get("Kenma::Commands::#{command}").run(*params)
        exit(true)
      rescue Kenma::Errors::NotExistError => e
        warn('Question does not exist. (invalid id)')
        exit(false)
      end
    })

    desc 'version', 'version'
    def version
      p Kenma::VERSION
    end
  end
end
