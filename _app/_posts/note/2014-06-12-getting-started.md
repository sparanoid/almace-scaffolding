---
layout: post
title: Getting Started
category: note
tags: getting-started
---

- TOC
{:toc}

## Requirements

Almace Scaffolding has exactly the same requirements as Jekyll. For more info please refer to [Installation - Jekyll](https://jekyllrb.com/docs/installation/).

## Method: Run in Docker

You can simply run Almace Scaffolding in Docker with `compose` command. Create your own `docker-compose.yml` file with the following content:

```yml
version: '3'

x-defaults: &defaults
  image: sparanoid/almace-scaffolding:latest
  restart: always
  volumes:
    - ./_app/_posts/:/app/_app/_posts/
  ports:
    - "4321:4321"

services:
  amsf:
    <<: *defaults
    command: serve
```

This is a minimal docker compose configuration with local `_posts` volume mounted inside the container. The [volumes](https://docs.docker.com/compose/compose-file/compose-file-v3/#volumes) option can be different based on your customization.

Mount custom data, pages, posts to override them inside container:

```yml
...
  volumes:
    - ./_app/_data/:/app/_app/_data/
    - ./_app/_pages/:/app/_app/_pages/
    - ./_app/_posts/:/app/_app/_posts/
```

Override config file:

```yml
...
  volumes:
    - ./_config.yml:/app/_config.yml
```

Use custom Gruntfile:

```yml
...
  volumes:
    - ./Gruntfile.coffee:/app/Gruntfile.coffee
```

Use custom AMSF config for custom themes and templates:

```yml
...
  volumes:
    - ./_app/:/app/_app/
    - ./_site/:/app/_site/
    - ./_amsf.yml:/app/_amsf.yml
```

You can see the example repo at [amsf/docker-amsf-example](https://github.com/amsf/docker-amsf-example).

### Custom Dependencies

You can load custom dependencies (custom Grunt plugins or Jekyll plugins) in Docker by building your own Docker images. First you need to create a `Dockerfile`:

```dockerfile
FROM sparanoid/almace-scaffolding:latest

# Copy custom dependencies configs
COPY Gemfile* /app/
COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock

# Reinstall project specific dependencies
RUN bundle install && yarn install
```

Then build your image with Docker Compose:

```yml
version: '3'

x-defaults: &defaults
  build:
    context: .
    dockerfile: Dockerfile
...
```

## Method: Run Locally

1. [Fork](https://github.com/sparanoid/almace-scaffolding/fork) or clone the repo.
2. Install dependencies with Ruby gem [`bundler`](https://bundler.io/) and Node.js package manager [`npm`](https://www.npmjs.org/).
3. Run `grunt init` to initialize your project.
4. Run `grunt serve` to fire up a local server.
5. Edit and customize your site.
6. Change Git remote to your own repo.
7. Push and deploy.

So in short for geeks:

```sh
$ git clone https://github.com/sparanoid/almace-scaffolding my-site
$ cd my-site
$ bundle install && yarn install
$ grunt init
$ grunt serve
# ...editing
$ git remote set-url origin https://github.com/sparanoid/my-site.git
$ git push -u origin master
# ...publishing
$ grunt && grunt deploy:rsync --env=prod
```

### Upgrading

It will be easy if you're a casual blogger and keep every core and template file untouched. You can use the following command to update Almace Scaffolding core files:

```sh
$ grunt amsf-update
```

It checks the latest Almace Scaffolding build from GitHub and updates core files automatically. Please keep in mind that if you changed some of the AMSF core files this action will **override** the changes you made. So it's recommended to keep your project under version control, you will always be able to compare changes for Almace Scaffolding.

### Using Beta Release

By default, when you run `amsf-update` you will get updated files from `release` branch. However, I'm continuously working on Almace Scaffolding, so there may have testing branches you can try and give me feedback if you're interested. You can check the AMSF GitHub repository for available branches, and it's very easy to switch:

```sh
$ grunt amsf-update --branch=feat/service-worker
```

The branch `master` is the one which is always available to check out and also has the latest changes:

```sh
$ grunt amsf-update --branch=master
```

If you messed up with the testing branch, don't worry, you can just run a normal update to revert them back:

```sh
$ grunt amsf-update
```

## Download

Go to the [GitHub repository](https://github.com/sparanoid/almace-scaffolding) for downloads, bug reports, and feature requests.

## Jekyll Migration

You can simply copy all posts from your old Jekyll setup into `_app/_posts`, you can also transfer your custom pages into `_app/_pages/`.
