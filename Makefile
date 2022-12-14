.PHONY: build push

build:
	bundle exec jekyll build

push:
	shopt -s dotglob && \
		rsync -rvze 'ssh -p $(PORT)' -p --chmod=D+rx,F+r _site/* \
		$(USER)@$(HOST):/var/vhost/register-dynamics.co.uk/www/
