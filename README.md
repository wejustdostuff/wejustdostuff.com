# middleman-site-wejustdostuff

> The www.wejustdostuff.com website powered by Middleman.

## Requirements

To build, run and deploy this project you need the following tools:

* [Rvm](https://rvm.io/)
* [Rake](http://rake.rubyforge.org/)
* [Node & Npm](http://nodejs.org/)
* [Bower](http://twitter.github.com/bower/)
* [Middleman](http://middlemanapp.com)
* [Middlesite](https://github.com/franklinkim/middlesite)

### Rvm

To install `rvm` on your system run:

```
$ curl -L https://get.rvm.io | bash -s stable --ruby=1.9.3
```

To update `rvm` run:

```
$ rvm get stable
```

*Install [Jewelybox](http://jewelrybox.unfiniti.com/) to see installed Rubys and Gems through a nice GUI.*

### Rake

To install `rake` run:

```
$ gem install rake
```

### Node & Npm

Download and run the latest installer at [nodejs.org](http://nodejs.org/).

### Bower

To install `bower` run:

```
$ sudo npm install bower -g
```

### Middleman

To install `middleman` run:

```
$ gem install middleman
```

## Workspace

### Setup

To setup your workspace checkout the repository:

```
$ git clone ssh://git@bitbucket.org/wejustdostuff/middleman-site-wejustdostuff.git
```

### Development

```bash
bundle exec middleman server
bundle exec middleman build
```

## License
Copyright (c) 2013 We Just Do Stuff.