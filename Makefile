VERSION = 11.03.21

all: vimrc 

vimrc:
	@echo "=================================="
	@echo "Installing .vimrc"
	
	@if test -f $(HOME)/.vimrc; then \
		echo -n "Replacing your $(HOME)/.vimrc with dot.vimrc?(Y/N) " && \
		read ANS; \
	else \
		ANS="Y"; \
	fi && \
	if [ "x$$ANS" = "xY" ]; then \
		install -m 0644 -T dot.vimrc $(HOME)/.vimrc && \
		echo "New .vimrc in $(HOME)/"; \
	else \
		echo "Skip."; \
	fi

.PHONY: install
