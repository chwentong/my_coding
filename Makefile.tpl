#
# $Id: Makefile.all,v 1.1.1.1 2005/05/20 19:58:29 gray Exp $
#

SOURCES = mpool.c mpool_t.c
HEADERS	= mpool.h
OBJECTS	= mpool.o

CC	= gcc
AR	= ar
MAKEDEP	= makedepend
RANLIB	= ranlib

CFLAGS	= -g -I. $(DEFINES)
LDFLAGS	=

DESTDIR	= /idv
TEST	= mpool_t
LIBRARY	= libmpool.a

all: $(LIBRARY)

clean:
	rm -f a.out core *.o *.t *.bak
	rm -f $(LIBRARY) $(TEST)

install: $(HEADERS) $(LIBRARY)
	install -c -m 444 $(HEADERS) $(DESTDIR)/include
	install -c -m 444 $(LIBRARY) $(DESTDIR)/lib

$(LIBRARY): $(OBJECTS)
	$(AR) cr $(LIBRARY) $?
	$(RANLIB) $@

test: $(TEST).o $(LIBRARY)
	$(CC) $(LDFLAGS) $(TEST).o -o $(TEST) $(LIBRARY)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

depend:
	$(MAKEDEP) -Y -- $(CFLAGS) -- $(SOURCES) 2>/dev/null

# Caution: ~make depend depends on the following lines!~
# DO NOT DELETE

mpool.o: mpool.h mpool_loc.h
mpool_t.o: mpool.h mpool_loc.h
