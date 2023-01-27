# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jbartosi <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/17 12:24:34 by jbartosi          #+#    #+#              #
#    Updated: 2023/01/27 09:38:35 by jbartosi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
SRCS = ft_printf.c ft_printnbr_base.c ft_printhex.c ft_printf_helper.c
OBJS = $(SRCS:.c=.o)
CFLAGS = -Wall -Wextra -Werror
LIBFT_PATH = ./libft
LIBFT_NAME = ./libft/libft.a

all: $(LIBFT_NAME) $(NAME)

$(LIBFT_NAME):
	make -C $(LIBFT_PATH)

$(NAME): $(OBJS)
	ar rcsT $(NAME) $(OBJS) $(LIBFT_NAME)

%.o: %.c
	cc $(CFLAGS) -c $(SRCS)

clean:
	make clean -C $(LIBFT_PATH)
	/bin/rm -f *.o

fclean: clean
	make fclean -C $(LIBFT_PATH)
	/bin/rm -f $(NAME)

re: fclean all

.PHONY:
	all clean fclean re
