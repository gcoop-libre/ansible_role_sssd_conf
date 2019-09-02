ROLE=gcoop-libre.sssd_conf

DEBUG ?= -v
ENV ?= test
SUDO ?=

INVENTORY=tests/inventory/$(ENV)
HOSTS=$(INVENTORY)/hosts
EXTRA='@$(INVENTORY)/extra_vars.yml'

role:
	mkdir -p tests/roles
	rm -f tests/roles/$(ROLE)
	cd tests/roles && ln -s ../../. $(ROLE)
	cd ..
	ansible-playbook $(DEBUG) -i $(HOSTS) $(SUDO) -e $(EXTRA) tests/test.yml

lint:
	mkdir -p tests/roles
	rm -f tests/roles/$(ROLE)
	cd tests/roles && ln -s ../../. $(ROLE)
	cd ..
	ansible-lint $(DEBUG) tests/test.yml

plugins/lookup/pass/lookup_plugins/pass.py:
	mkdir -p plugins/lookup
	git clone https://github.com/gcoop-libre/ansible-lookup-plugin-pass.git plugins/lookup/pass

dependencies: plugins/lookup/pass/lookup_plugins/pass.py

requirements:
	cd roles && ansible-galaxy install -r requirements.yml -p .
