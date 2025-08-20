#!/bin/bash

git clone git@github.com:j-wang/mac-dev-playbook.git

pip install ansible && \
	xcode-select --install && \
	ansible-galaxy install -r ./mac-dev-playbook/requirements.yml && \
	ansible-playbook ./mac-dev-playbook/main.yml -i inventory -K
