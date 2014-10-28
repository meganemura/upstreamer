# encoding: utf-8

require 'octokit'
require 'rugged'

module Upstreamer
  class CLI
    def self.run(argv = ARGV)
      self.new(argv).run
    end

    def initialize(argv = ARGV)
      @argv = argv
    end

    def run
      directory = specified_directory || current_directory
      repo = Rugged::Repository.new(directory)

      if repo.remotes['upstream']
        log_error "Error: Remote 'upstream' already exists. (#{repo.remotes['upstream'].url})"
        return
      end

      remote = repo.remotes['origin']                               # https://github.com/meganemura/bundler.git
      unless remote
        log_error "Error: Could not find remote 'origin'. (#{directory})"
        return
      end
      username_repository = remote.url[/github.com\/(.*)\.git/, 1]  # meganemura/bundler

      repository = Octokit.repository(username_repository)
      unless repository.fork?
        log_error "Error: This repository is not forked repository. (#{directory})"
        return
      end
      upstream_url = repository.parent.clone_url

      repo.remotes.create('upstream', upstream_url)
      puts "git remote add upstream #{upstream_url}"
    end

    def specified_directory
      @argv.first
    end

    def current_directory
      Dir.pwd
    end

    def log_error(message)
      STDERR.puts(message) unless quiet
    end

    def quiet
      false
    end
  end
end
