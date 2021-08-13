.PHONY: build push

build:
	bundle exec jekyll build --future

push:
	shopt -s dotglob && scp -r -P $(PORT) _site/* $(USER)@$(HOST):/var/vhost/register-dynamics.co.uk/www/
