CURDIR=$(shell pwd)
DC_MASTER="dc_master.yaml"
DC_TEMP="docker-compose.yaml"
GLOBAL_PREFIX=docker-
DOCKER_IN_GROUPS=$(shell groups | grep "docker")
MYID=$(shell id -u)

# Set the user according to fork
ifeq ($(strip $(GLOBAL_PREFIX)),"freetz") 
	USER=freetz
else
	# freetz-ng and other forks
	USER=user
endif

ifeq ($(strip $(DOCKER_IN_GROUPS)),)
	DC_CMD=sudo docker compose
else
	DC_CMD=docker compose
endif


all: root_check preparations run_build run_bash
preps: root_check preparations
build: root_check preparations run_build
restart: run_restart
fromscratch: root_check preparations run_remove run_build
remove: root_check run_remove


root_check:
	@if [ "${MYID}" = "0" ]; then \
		echo Please do not run as root. It is neither recommended nor would it work.; \
	fi
	@exit

preparations:
	mkdir -p ${CURDIR}/vol/git
	cat ${DC_MASTER} \
		| sed 's|<USER>|${USER}|g' \
		| sed 's|<CURDIR>|${CURDIR}|g' \
		| sed 's|<GLOBAL_PREFIX>|${GLOBAL_PREFIX}|g' \
		> ${DC_TEMP}

	cat docker/dockerfile_master \
	| sed 's|<USER>|$(USER)|g' \
	| sed 's|<UID>|$(MYID)|g' \
	> docker/dockerfile

run_build:
	$(DC_CMD) build freetz

run_remove:
	$(DC_CMD) down --rmi all
	$(DC_CMD) rm --force

run_restart:
	$(DC_CMD) restart

run_bash:
	$(DC_CMD) run --rm freetz bash
