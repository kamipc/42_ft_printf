# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cpinho-c <cpinho-c@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/11 14:55:53 by cpinho-c          #+#    #+#              #
#    Updated: 2026/03/05 22:37:17 by cpinho-c         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
AR = ar rcs
CC = gcc
CFLAGS = -Wall -Wextra -Werror
SRCS = ft_printf.c printf_char.c printf_digits.c printf_str.c \
	   printf_uns.c printf_hex.c printf_ptr.c
	
OBJS = $(SRCS:.c=.o)
RM = rm -rf
LIBFT_DIR = ./libft
LIBFT = $(LIBFT_DIR)/libft.a
LIBFT_GIT = https://github.com/kamipc/42_Libft.git

.SILENT:

all: $(NAME)

$(LIBFT):
	@if [ ! -d "$(LIBFT_DIR)" ]; then \
	echo "Cloning libft (ORIG_PROJECT branch)..."; \
	git clone -b ORIG_PROJECT $(LIBFT_GIT) $(LIBFT_DIR); \
	fi
	$(MAKE) -C $(LIBFT_DIR)
	echo "Libft compiled successfully!"
	
$(NAME): $(LIBFT) $(OBJS)
	$(AR) $(NAME) $(OBJS) libft/*.o
	echo "$(NAME) compiled successfuly!"

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJS) 
	@if [ -d "$(LIBFT_DIR)" ]; then $(MAKE) -C $(LIBFT_DIR) clean; fi

fclean: clean
	$(RM) $(NAME)
	@if [ -d "$(LIBFT_DIR)" ]; then $(MAKE) -C $(LIBFT_DIR) fclean; fi

re: fclean all
