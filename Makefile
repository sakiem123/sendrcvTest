CC        := gcc
INCLUDE   := -I include
DEST      := bin
PROGRAM   := myprogram
SRCDIR    := src
SRCS      := $(wildcard $(SRCDIR)/*.c)
OBJDIR    := obj
OBJS      := $(addprefix $(OBJDIR)/,$(patsubst %.c,%.o,$(SRCS)))

.PHONY: all clean test
all: $(PROGRAM)

test:
				echo %.o: %.c

$(PROGRAM):    $(OBJS)
				$(CC) -o $(DEST)/$@ $^

$(OBJDIR)/%.o: %.c
				@if [ ! -e `dirname $@` ]; then mkdir -p `dirname $@`; fi
				$(CC) $(INCLUDE) -o $@ -c $<


clean:
				rm -rf obj/src
				rm -f bin/* obj/*

