CC := g++
OPT := -g
WARN := -Wall
INC := -I include
STD := -std=c++11
CFLAGS := $(OPT) $(WARN) $(INC) $(STD)

OBJDIR  := bin
SRCDIR  := src

BINNAME := out

# List all your .cc/.cpp files here (source files, excluding header files)
SRCS := main

# List corresponding compiled object files here (.o files)
SRC_OBJS = $(addsuffix .o,$(addprefix $(OBJDIR)/,$(SRCS)))

#################################

# default rule

all: $(SRC_OBJS)
	$(CC) -o $(BINNAME) $(CFLAGS) $(SRC_OBJS) -lm
	@echo "----- Compilation finished -----"

$(OBJDIR):
	@mkdir -p $@

# generic rule for converting any .cpp file to any .o file

$(OBJDIR)/%.o: $(SRCDIR)/%.cc | $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@


clean:
	rm -rf $(BINNAME) $(OBJDIR)


clobber:
	rm -rf $(OBJDIR)
