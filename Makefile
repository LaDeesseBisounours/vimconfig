CFLAFS=-O2 -Wall -Wextra -Werror
all: change_opacity

install: change_opacity 
	cp change_opacity /usr/bin
	chmod u+x /usr/bin/change_opacity

change_opacity: change_opacity.c
	gcc $(CFLAFS) $< -o $@
