appdir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))static
nginx.root.conf:
	echo "root ${appdir};" > $@