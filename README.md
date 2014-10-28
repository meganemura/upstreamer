[![Gem Version](https://img.shields.io/gem/v/upstreamer.svg?style=flat)](http://badge.fury.io/rb/upstreamer)
[![Dependency Status](https://img.shields.io/gemnasium/meganemura/upstreamer.svg?style=flat)](https://gemnasium.com/meganemura/upstreamer)
[![Code Climate](https://img.shields.io/codeclimate/github/meganemura/upstreamer.svg?style=flat)](https://codeclimate.com/github/meganemura/upstreamer)

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

### Batch configure

```shell
$ ls -1 /path/to/your-repositories-directory
forked-repo1
forked-repo2
forked-repo3
$ ls -1 /path/to/your-repositories-directory | xargs -n1 upstreamer
git remote add upstream https://github.com/upstream-username/forked-repo1.git
git remote add upstream https://github.com/upstream-username/forked-repo2.git
git remote add upstream https://github.com/upstream-username/forked-repo3.git
```

### Using with [ghq](https://github.com/motemen/ghq)
```shell
$ ghq list --full-path | grep github.com/your-username | xargs -n1 upstreamer
```

## Contributing

1. Fork it ( https://github.com/meganemura/upstreamer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
