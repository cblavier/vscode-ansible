# Motivations

I want a seamless way to switch between devices while coding (macbookpro / imac / ipad). 

- [VSCode offers a remote SSH](https://code.visualstudio.com/docs/remote/ssh) feature which allows your local VScode editor to remotely edit code, run terminals ... which is perfect
for computers.

- [code-server](https://github.com/cdr/code-server) also offers a feature to make a full featured VSCode environment run in your browser or as a PWA (which can be helpful from an iPad)

It is now feasible with the power of new Silicon M1 CPU 🔥

# Components

This project will help at setting up a Mac M1 (arm64) VPS with :
- code-server
- elixir (with asdf)
- node (with nvm)
- ruby (with rbenv)
- chromedriver
- postgresql
- nginx as a reverse proxy in front of code-server
- various shell things such as ohmyzsh, autojump, tmux or direnv

# Setup

Guidelines to provision a development server with Ansible

- first, provision a Silicon M1 VPS from any cloud vendor (I use a MacMini M1 from scaleway)

- make sure you can ssh to your newly created VPS

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
