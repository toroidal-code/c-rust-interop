### Makefile --- 
## 
## Filename: Makefile
## Description: A generic C Makefile
## Author: Katherine Whitlock - toroidalcode
## Created: Tue Jun 24 17:45:43 2014 (-0400)
## Version: 0.1
######################################################################
## 
### Code:


all: main

RUST_REQ_LIBS = \
	-ldl \
	-lpthread \
	-lgcc_s \
	-lpthread \
	-lc \
	-lm \

CFLAGS += \
	-std=c11 \
	-W \
	-Wall \
 
%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.a : %.rs
	rustc -o $@ $<
 
main : main.o lib.a 
	clang -o $@ $^ $(RUST_REQ_LIBS)

# For every 'O' in TARGETS, generate a build target
# $(foreach O, $(TARGETS), $(eval $O: $O.o))
 
clean:
	rm -f *.o *.a
 
######################################################################
### Makefile ends here