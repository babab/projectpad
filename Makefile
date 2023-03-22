BASE_PATH		= /usr
BIN_PATH		= ${BASE_PATH}/local/bin
BASH_COMPLETIONSDIR	= $$(pkg-config --variable=completionsdir bash-completion)
ZSH_SITE_FUNCS_PATH	= ${BASE_PATH}/share/zsh/site-functions

export SHELLCHECK_OPTS = --check-sourced --enable \
	avoid-nullary-conditions,check-unassigned-uppercase,deprecate-which

make:
	@echo '### VARS ###'
	@echo BASE_PATH=${BASE_PATH}
	@echo BIN_PATH=${BIN_PATH}
	@echo BASH_COMPLETIONSDIR=${BASH_COMPLETIONSDIR}
	@echo ZSH_SITE_FUNCS_PATH=${ZSH_SITE_FUNCS_PATH}
	@printf '\n### TARGETS ###\n'
	@echo 'make install   -- install projectpad'
	@echo 'make uninstall -- uninstall projectpad'
	@echo 'make check     -- check scripts for correct (POSIX) syntax'

install:
	install -Dm 755 projectpad ${BIN_PATH}
	install -Dm 644 completion/zsh/_projectpad $(ZSH_SITE_FUNCS_PATH)
	test -n "${BASH_COMPLETIONSDIR}" || (printf "\nerror: BASH_COMPLETIONSDIR not found\n" && false)
	install -Dm 644 completion/bash/projectpad $(BASH_COMPLETIONSDIR)
uninstall:
	rm -f $(BASE_PATH)/local/bin/projectpad
	rm -f $(ZSH_SITE_FUNCS_PATH)/_projectpad
	test -n "${BASH_COMPLETIONSDIR}" && rm -f "${BASH_COMPLETIONSDIR}/projectpad"

check:
	# check projectpad with all possible shell specifications
	shellcheck --shell=sh projectpad
	shellcheck --shell=dash projectpad
	shellcheck --shell=bash projectpad
	shellcheck --shell=ksh projectpad
	# check bash and zsh completion scripts
	shellcheck --shell=bash completion/bash/projectpad
	zsh --no-exec completion/zsh/_projectpad
