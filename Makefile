.PHONY: build push

SHELL := bash
SSH_FLAGS ?=

build:
	bundle exec jekyll build

push:
	shopt -s dotglob && \
		rsync -rvze 'ssh -p $(PORT) $(SSH_FLAGS)' -p --chmod=D+rx,F+r _site/* \
		$(USER)@$(HOST):/var/vhost/register-dynamics.co.uk/www/
