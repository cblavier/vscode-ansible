# Motivations

I wanted a seamless way to switch between devices while coding (macbookpro / imac / ipad).

- [VSCode offers a remote SSH](https://code.visualstudio.com/docs/remote/ssh) feature which allows your local VScode editor to remotely edit code, run terminals ... which is perfect
for computers.

- [coder.com](http://coder.com) also offers a feature to make a full featured VSCode environment run in your browser or as a PWA (which can be helpful from an iPad)

# Components

This project will help at setting up a ubuntu VPS with :
- Docker
- code-server
- elixir (with asdf)
- chromedriver
- node (with nvm)
- postgresql
- nginx as a reverse proxy in front of code-server, webpack and your project
- various shell things such as ohmyzsh, autojump, tmux or direnv

# Setup

Guidelines to provision a development server with Ansible

- first, provision a VPS from any cloud vendor (I use a Digital Ocean $40/mo VPS with Ubuntu 18.04)

- make sure you can root ssh to your newly created VPS

- register following domain names all set with `A record` to your VPS IP
  - `ssh.mydomain.com` used by you or ansible to ssh to your VPS
  - `vscode.mydomain.com` to access code-server web interface
  - `webpack.mydomain.com` to reach webpack dev server, that will hot render assets
  - `myproject.mydomain.com` to reach your dev server

- locally install ansible: `brew install ansible`.

- install homebrew package plugin for ansible : `ansible-galaxy collection install community.general`

- create an ansible config file in `~/.ansible.cfg`.
  ```
  [defaults]
  inventory = ~/.ansible/hosts
  ```

- create an ansible inventory in `~/.ansible/hosts`	- create an ansible inventory in `~/.ansible/hosts`.
  ```
  ssh.mydomain.com
  ```

- copy `variables/all.template.yml` to `variables/all.yml` and change variables to your convenience.

- copy `variables/become_pass.template.yml` to `variables/become_pass.yml` and set your privileged user password in it.

- run `ansible-playbook playbook.yml`.
