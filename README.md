# Setup

Guidelines to provision a cloud server from a Mac.

- provision a VPS from any cloud vendor (I use a $40/mo VPS server from Digital Ocean)
- register a domain name (I use `code.mydomain.com` ) and set a `A record` to your VPS IP
- locally install ansible: `brew install ansible`
- create an ansible config file in `~/.ansible.cfg`
  ```
  [defaults]
  inventory = ~/.ansible/hosts
  ```

- create an ansible inventory in `~/.ansible/hosts`
  ```
  code.mydomain.com
  ```

- copy `variables/all.template.yml` to `variables/all.yml` and change variables to your convenience
- run `ansible-playbook playbook.yml`
