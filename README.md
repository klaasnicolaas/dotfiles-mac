## What is this?

This is a repository with my personal configuration files for development on a Mac. It contains a bash script that installs all the necessary packages and sets up the configuration files.

## How to install configuration?

```bash
git clone https://github.com/klaasnicolaas/dotfiles-mac.git
cd dotfiles-mac && bash install.sh
```

__Note: make sure that you clone the repository in your home directory.__

## Installed packages

The following platforms are installed and set up by default with the bash script:

- [Homebrew][brew] - Package manager for macOS
- [GitHub CLI][gh] - Command-line tool for GitHub
- [Oh My Zsh][omz] (with [Oh My Posh][omp] theme and many plugins)
- [Pyenv][pyenv] - Python version manager
- [Uv][uv] - Python virtual environment manager
- [Nvm][nvm] - Node version manager (with [yarn])
- [Rbenv][rbenv] - Ruby version manager (with ruby-build)
- [Composer][composer] - PHP dependency manager

## Manual installations

After running the bash script, there are still some manual installations that need to be done.

This is the case for:

- [Git config](#setup-git-config) (name and email)
- [Node.JS/NPM](#setup-nodejsnpm) (via nvm)
- [Python](#install-a-python-version) (via pyenv)
- [Ruby](#install-a-ruby-version) (via rbenv)

### Setup Git config

For Git to work properly, you need to set up your name and email address.

```bash
git config --global user.name "John Doe"
git config --global user.email "hello@example.com"
```

In case you have issues with pushing to a repository, you can increase the buffer size with the following command:

Error message: `error: RPC failed; HTTP 400 curl 22 The requested URL returned error: 400`

```bash
git config --global http.postBuffer 157286400
```

### Install a python version

The use of **pyenv** is recommended to manage multiple python versions, with the `grep` command we can narrow down the list with newer versions.

```bash
pyenv install --list | grep -E "^\s*3\.(11|12|13)(\..*|-dev.*)"
pyenv install 3.12.5
pyenv global 3.12.5
```

### Setup Node.JS/NPM

Version 20 is currently the LTS version.

```bash
nvm install 22
nvm use 22
nvm alias default 22
```

### Install a ruby version

The use of **rbenv** is recommended to manage multiple ruby versions.

```bash
rbenv install 3.3.1
rbenv global 3.3.1
```

## Awesome tools

The following tools are not installed by default, but are recommended for development on a Mac:

- [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop)
- [Rectangle](https://rectangleapp.com)
- [VSCode](https://code.visualstudio.com)
- [iTerm2](https://iterm2.com)
- [Postman](https://www.postman.com)
- [Laravel Valet](https://laravel.com/docs/11.x/valet)
- [PHP Monitor](https://github.com/nicoverbruggen/phpmon)

## License

Distributed under the **MIT** License. See [`LICENSE`](LICENSE) for more information.

<!-- Links -->
[brew]: https://brew.sh
[composer]: https://github.com/composer/composer
[gh]: https://cli.github.com
[omz]: https://github.com/ohmyzsh/ohmyzsh
[omp]: https://ohmyposh.dev
[pyenv]: https://github.com/pyenv/pyenv
[rbenv]: https://github.com/rbenv/rbenv
[uv]: https://github.com/astral-sh/uv
[yarn]: https://yarnpkg.com
[nvm]: https://github.com/nvm-sh/nvm