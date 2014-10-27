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
        puts "Error: Remote 'upstream' already exists. (#{repo.remotes['upstream'].url})"
        return
      end

      remote = repo.remotes['origin']                               # https://github.com/meganemura/bundler.git
      username_repository = remote.url[/github.com\/(.*)\.git/, 1]  # meganemura/bundler

      repository = Octokit.repository(username_repository)
      unless repository.fork?
        puts 'Error: this repository is not forked repository'
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
  end
end
