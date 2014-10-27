# Upstreamer

Add `upstream` remote-tracking branch to your forked repository by tracking GitHub.

## Usage

```shell
$ gem install upstreamer
$ cd /path/to/forked-repository
$ git remote -v
origin  https://github.com/your-username/forked-repository.git (fetch)
origin  https://github.com/your-username/forked-repository.git (push)

$ upstreamer
git remote add upstream https://github.com/upstream-username/forked-repository.git

$ git remote -v
origin  https://github.com/your-username/forked-repository.git (fetch)
origin  https://github.com/your-username/forked-repository.git (push)
upstream        https://github.com/upstream-username/forked-repository.git (fetch)
upstream        https://github.com/upstream-username/forked-repository.git (push)
```

## Contributing

1. Fork it ( https://github.com/meganemura/upstreamer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
