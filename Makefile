#
# custom Makefile for replit.com C coding
# edit PROGRAM value to change executable
# also edit .replit to match PROGRAM

PROGRAM = main

CC = clang
override CFLAGS += -g -Wall -pthread -lm -Wall -Wextra -pedantic -std=c99

SRCS = $(shell find . -name '.ccls-cache' -type d -prune -o -type f -name '*.c' -print)
HEADERS = $(shell find . -name '.ccls-cache' -type d -prune -o -type f -name '*.h' -print)

# primary target

all:: $(PROGRAM) $(PROGRAM)-debug
	@echo SRCS are made

$(PROGRAM): $(SRCS) $(HEADERS)
	$(CC) $(CFLAGS) $(SRCS) -o "$@"

$(PROGRAM)-debug: $(SRCS) $(HEADERS)
	$(CC) $(CFLAGS) $(SRCS) -o "$@"

clean:
	-rm -f $(PROGRAM) $(PROGRAM)-debug