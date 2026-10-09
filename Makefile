PREFIX  ?= /usr/local
BINDIR  ?= $(PREFIX)/bin

VERSION  = 0.5.0-dev
MACHTYPE = $(shell $(CC) -dumpmachine)

BUILDDIR = build
PROG = $(BUILDDIR)/llama-shell
SRCS = src/main.c src/command.c src/getargs.c
OBJS = $(SRCS:src/%.c=$(BUILDDIR)/%.o)
HDRS = src/command.h src/getargs.h

CFLAGS   ?= -O2 -Wall
CPPFLAGS += -DHAVE_LIBINTL_H=1 -DVERSION='"$(VERSION)"' -DMACHTYPE='"$(MACHTYPE)"'

all: $(PROG)

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)

$(BUILDDIR)/%.o: src/%.c $(HDRS) | $(BUILDDIR)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<

$(BUILDDIR):
	mkdir -p $@

run: $(PROG)
	./$(PROG) $(ARGS)

clean:
	rm -rf $(BUILDDIR)

install: $(PROG)
	install -Dm 0755 $(PROG) $(DESTDIR)$(BINDIR)/llama-shell

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/llama-shell

.PHONY: all run clean install uninstall
