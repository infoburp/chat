# ii - irc it - simple but flexible IRC client
#   (C)opyright MMV-MMVI Anselm R. Garbe
#   (C)opyright MMV-MMVII Anselm R. Garbe, Nico Golde

include config.mk

SRC      = chat.c
OBJ      = ${SRC:.c=.o}

all: options chat
	@echo built chat

options:
	@echo chat build options:
	@echo "LIBS     = ${LIBS}"
	@echo "INCLUDES = ${INCLUDES}"
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

dist: clean
	@mkdir -p chat-${VERSION}
	@cp -R query.sh Makefile CHANGES README FAQ LICENSE config.mk chat.c chat.1 chat-${VERSION}
	@tar -cf chat-${VERSION}.tar chat-${VERSION}
	@gzip chat-${VERSION}.tar
	@rm -rf chat-${VERSION}
	@echo created distribution chat-${VERSION}.tar.gz

chat: ${OBJ}
	@echo LD $@
	@${CC} -o $@ ${OBJ} ${LDFLAGS}

install: all
	@mkdir -p ${DESTDIR}${DOCDIR}
	@mkdir -p ${DESTDIR}${BINDIR}
	@mkdir -p ${DESTDIR}${MAN1DIR}

	@install -d ${DESTDIR}${BINDIR} ${DESTDIR}${MAN1DIR}
	@install -m 644 CHANGES README query.sh FAQ LICENSE ${DESTDIR}${DOCDIR}
	@install -m 775 chat ${DESTDIR}${BINDIR}
	@install -m 444 chat.1 ${DESTDIR}${MAN1DIR}
	@echo "installed chat"

uninstall: all
	@rm -f ${DESTDIR}${MAN1DIR}/chat.1
	@rm -rf ${DESTDIR}${DOCDIR}
	@rm -f ${DESTDIR}${BINDIR}/chat
	@echo "uninstalled chat"

clean:
	rm -f chat *~ *.o *core *.tar.gz
