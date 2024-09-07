SRC_DIR := home
DEST_DIR := $(HOME)

CFG_TARGETS := $(sort $(filter-out help list all, \
	$(patsubst %:,%,$(shell grep -E '[a-zA-Z]+:$$' Makefile))) \
	$(notdir $(wildcard $(SRC_DIR)/.config/*)))

define SYMLINK
	@mkdir -p $(dir $(DEST_DIR)/$(1))
	@rm -rf $(DEST_DIR)/$(1)
	@ln -sr $(SRC_DIR)/$(1) $(DEST_DIR)/$(1)
	@printf "%s -> %s\n" $(notdir $(1)) $(DEST_DIR)/$(1)
endef

help:
	@printf "%s\n" \
		"usage: make [target]" \
		"" \
		"targets:" \
		"    <config> # setup single config" \
		"    all      # setup all configs" \
		"    list     # list configs" \
		"    help     # print help"

list:
	@printf "%s\n" $(CFG_TARGETS)

all: $(CFG_TARGETS)

$(notdir $(wildcard $(SRC_DIR)/.config/*)):
	$(call SYMLINK,.config/$@)

bash:
	$(call SYMLINK,.profile)
	$(call SYMLINK,.bashrc)
	$(call SYMLINK,.inputrc)
	$(call SYMLINK,.dircolors)

vim:
	$(call SYMLINK,.vimrc)
	$(call SYMLINK,.vim/colors)

tmux:
	$(call SYMLINK,.tmux.conf)

gpg:
	$(call SYMLINK,.gnupg/gpg.conf)

bin snips tmpls:
	$(call SYMLINK,$@)
