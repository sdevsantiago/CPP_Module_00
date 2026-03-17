# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sede-san <sede-san@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/07/30 20:22:21 by sede-san          #+#    #+#              #
#    Updated: 2026/03/16 20:31:13 by sede-san         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ********************************** Config ********************************** #

EXERCISES ?= exXX

# ********************************* Rules ************************************ #

all:
	@for exercise in $(EXERCISES); do \
		$(MAKE) -C $$exercise; \
	done
.PHONY: all

clean:
	@for exercise in $(EXERCISES); do \
		$(MAKE) -C $$exercise clean; \
	done
.PHONY: clean

fclean:
	@for exercise in $(EXERCISES); do \
		$(MAKE) -C $$exercise fclean; \
	done
.PHONY: fclean

re: fclean all
.PHONY: re

# ***************************** Makefile config ****************************** #

MAKEFLAGS	+= --no-print-directory
