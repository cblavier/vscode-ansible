# Setup

Guidelines to provision a cloud server from a Mac.

- provision a VPS from any cloud vendor (I use a Digital Ocean $40/mo VPS with Ubuntu 18.04)

- register following domain names all set with `A record` to your VPS IP
  - `ssh.mydomain.com` used by you or ansible to ssh to your VPS
  - `vscode.mydomain.com` to access code-server web interface
  - `webpack.mydomain.com` to reach webpack dev server, that will hot render assets
  - `myproject.mydomain.com` to reach your dev server

- locally install ansible: `brew install ansible`

- create an ansible config file in `~/.ansible.cfg`

- copy `variables/all.template.yml` to `variables/all.yml` and change variables to your convenience. Espcially:
  - host, code_server_remote_host, webpack_remote_host and project_remote_host
  - username
  - timezone
  - code_server_password
  - letsencrypt_email
  - project_name
  - project_git_url

- run `ansible-playbook playbook.yml`
