#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gle-moig <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/07/21 10:12:03 by gle-moig          #+#    #+#              #
#    Updated: 2016/07/21 12:48:30 by gle-moig         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME		=	ft_cat
DIRSRC		=	./srcs
INCLUDE		=	./includes
SRC			=	main.c

OBJ			=	$(SRC:.c=.o)

ifdef FLAGS
	ifeq ($(FLAGS), no)
CFLAGS		=
	endif
	ifeq ($(FLAGS), debug)
CFLAGS		=	-Wall -Wextra -Werror -ansi -pedantic -g
	endif
else
CFLAGS		=	-Wall -Wextra -Werror
endif

CC			=	gcc
RM			=	rm -f
ECHO		=	echo

all		:		$(NAME)

$(NAME)	:		$(OBJ)
				$(CC) $(CFLAGS) -o $(NAME) $(OBJ)
				@$(ECHO) '> Compiled'

clean	:
				@$(RM) $(OBJ)
				@$(ECHO) '> Directory cleaned'


fclean	:		clean
				@$(RM) $(NAME)
				@$(ECHO) '> Remove executable'

re		:		fclean all

.PHONY	:		all clean re

%.o		:		$(DIRSRC)/%.c
				$(CC) -I $(INCLUDE) $(CFLAGS) -o $@ -c $<
