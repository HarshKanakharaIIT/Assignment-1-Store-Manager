# Compiler and options
COMP = gcc
OPTS = -Wall -g -O0

# Source, objects, and headers
SRCS = test_assign1_1.c storage_mgr.c dberror.c
OBJS = $(SRCS:.c=.o)
HDRS = storage_mgr.h dberror.h test_helper.h

# Output program
PROG = test_assign1

# Declare phony targets
.PHONY: default clean

# Default target
default: $(PROG)

# Link objects into the test_assign1 binary
$(PROG): $(OBJS)
	$(COMP) $(OBJS) -o $(PROG)

# Compile sources with header dependencies
%.o: %.c $(HDRS)
	$(COMP) $(OPTS) -c $< -o $@

# Clean up build artifacts
clean:
	rm -f $(OBJS) $(PROG)
