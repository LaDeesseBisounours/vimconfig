CFLAFS=-O2 -Wall -Wextra -Werror
all: change_opacity

install: change_opacity pamixeradd
	cp change_opacity /usr/bin
	cp pamixeradd  /usr/bin
	chmod u+x /usr/bin/change_opacity
	chmod u+x /usr/bin/pamixeradd

change_opacity: change_opacity.c
	gcc $(CFLAFS) $< -o $@
