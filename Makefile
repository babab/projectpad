BASE_PATH		= /usr
BIN_PATH		= ${BASE_PATH}/local/bin
ZSH_SITE_FUNCS_PATH	= ${BASE_PATH}/share/zsh/site-functions

make:
	@echo 'make install   -- install projectpad'
	@echo 'make uninstall -- uninstall projectpad'

install:
	install -Dm 755 projectpad ${BIN_PATH}
	install -Dm 644 zsh/_projectpad $(ZSH_SITE_FUNCS_PATH)
uninstall:
	rm -f $(BASE_PATH)/local/bin/projectpad
	rm -f $(ZSH_SITE_FUNCS_PATH)/_projectpad
