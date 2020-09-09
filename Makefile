# Makefile

CC := gcc
LD := gcc
CFLAGS := -Wall -Werror -Wextra -g -c -fsanitize=address,undefined $(INCLUDES) #-I./include
LDFLAGS := -lc -e _main -arch x86_64 -fsanitize=address,undefined

SRCDIR := src
OBJDIR := obj
BINDIR := bin
SRCEXT := c
INCLUDES := -I./include

HDRS := bigint.h
SRCS := $(addprefix $(SRCDIR)/, bigint.c main.c)
#SRCS := $(shell find -s $(SRCDIR) -name *.$(SRCEXT))
#OBJS := $(patsubst $(SRCDIR)/%, $(OBJDIR)/%,$(SRC:.c=.o))
OBJS := $(patsubst $(SRCDIR)/%.$(SRCEXT), $(OBJDIR)/%.o, $(SRCS))
NAME := a.out


all : mkdirs $(NAME)

$(NAME) : $(OBJS)
	$(LD) $(LDFLAGS) $^ -o $(BINDIR)/$@

$(OBJDIR)/%.o : $(SRCDIR)/%.c
	$(CC) $(CFLAGS) $< -o $@

mkdirs :
	@if [[ ! -e $(OBJDIR) ]]; then mkdir $(OBJDIR); fi
	@if [[ ! -e $(BINDIR) ]]; then mkdir $(BINDIR); fi

clean :
	@rm -rf $(OBJDIR)

fclean : clean
	@rm -rf $(BINDIR)

re : fclean all

install : $(NAME)
	@echo "install"

lint :
	@echo "lint"

debug :
	@echo $(INCLUDES)

.PNOHY : all clean fclean re mkdirs install lint debug
