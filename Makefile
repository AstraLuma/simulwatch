all: config deps
.PHONY: all

# Start test nginx
test: all
	mkdir -p /tmp/nginx/logs
	nginx -c nginx.test.conf -p .
.PHONY: test

# Generate some bits of configuration necessary for the daemons
config: nginx.root.conf
.PHONY: config

appdir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))static
nginx.root.conf:
	echo "root ${appdir};" > $@

# Here's dependencies we're using. They're in git so we don't end up with version mismatches, but this will remake them
deps: static/js/zepto.min.js static/js/stomp.min.js
.PHONY: deps

static/js/zepto.min.js:
	wget http://zeptojs.com/zepto.min.js -O $@

static/js/stomp.min.js:
	wget https://github.com/ThoughtWire/stomp-websocket/raw/3.0/lib/stomp.min.js -O $@

clean:
	rm nginx.root.conf
.PHONY: clean