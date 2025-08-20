#!/bin/bash

git clone git@github.com:j-wang/mac-dev-playbook.git

pip install ansible && \
	xcode-select --install && \
	ansible-galaxy install -r requirements.yml && \
	ansible-playbook main.yml -i inventory -K
