# Motivations

Since I frequently switch between different devices while coding (macbookpro / imac / ipad), I wanted a seamless way to switch between devices when coding a single project.

- VSCode offers a remote SSH feature which allows your local VScode editor to remotely edit code, run terminals ... which is perfect
for computers.

- [coder.com](coder.com) also offers a feature to make a full featured VSCode environment run in your browser (which can be helpful from an iPad)

# Components

This project will help at setting up a ubuntu VPS with :
- docker
- code-server
- elixir (with asdf)
- node (with nvm)
- postgresql
- nginx as a reverse proxy in front of code-server, webpack and your project
- various shell things such as ohmyzsh, autojump or direnv

# Setup

Guidelines to provision a development server with Ansible

- first, provision a VPS from any cloud vendor (I use a Digital Ocean $40/mo VPS with Ubuntu 18.04)

- make sure you can root ssh to your newly created VPS

- register following domain names all set with `A record` to your VPS IP
  - `ssh.mydomain.com` used by you or ansible to ssh to your VPS
  - `vscode.mydomain.com` to access code-server web interface
  - `webpack.mydomain.com` to reach webpack dev server, that will hot render assets
  - `myproject.mydomain.com` to reach your dev server

- locally install ansible: `brew install ansible`

- create an ansible config file in `~/.ansible.cfg`
  ```
  [defaults]
  inventory = ~/.ansible/hosts
  ```

- create an ansible inventory in `~/.ansible/hosts`	- create an ansible inventory in `~/.ansible/hosts`
  ```
  ssh.mydomain.com
  ```

- copy `variables/all.template.yml` to `variables/all.yml` and change variables to your convenience. Espcially:
  - host, code_server_remote_host, webpack_remote_host and project_remote_host
  - username
  - timezone
  - code_server_password
  - letsencrypt_email
  - project_name
  - project_git_url

- run `ansible-playbook playbook.yml`
