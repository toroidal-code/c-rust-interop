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

RUST_LIBS += \
	-lstd-e32fa708-0.11.0 \
	-lrustrt-805dca70-0.11.0 \

CFLAGS += \
	-std=c11 \
	-W \
	-Wall \
 
%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.o : %.rs
	rustc --emit obj -o $@ $<
 
main : lib.o main.o
	clang -o $@ $^ $(RUST_LIBS)

# For every 'O' in TARGETS, generate a build target
# $(foreach O, $(TARGETS), $(eval $O: $O.o))
 
clean:
	rm -f *.o
 
######################################################################
### Makefile ends here