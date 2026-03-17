# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sede-san <sede-san@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/07/30 20:22:21 by sede-san          #+#    #+#              #
#    Updated: 2026/03/17 01:56:10 by sede-san         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ********************************** Config ********************************** #

NAME := megaphone

CXX	:= c++
CXXSTANDARD := c++98

SRC_DIR	:= .
OBJ_DIR	:= build

# SRCS =
SRCS := $(shell find $(SRC_DIR) -type f -name "*.cpp")
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRCS))

# ****************************** Build options ******************************* #

BUILD ?= debug
SANITIZER ?= none

VALID_BUILDS := release debug
VALID_SANITIZERS := none asan ubsan valgrind lldb

ifeq ($(filter $(BUILD),$(VALID_BUILDS)),)
	$(error BUILD must be one of: $(VALID_BUILDS))
endif

ifeq ($(filter $(SANITIZER),$(VALID_SANITIZERS)),)
	$(error SANITIZER must be one of: $(VALID_SANITIZERS))
endif

# ****************************** Compiler flags ****************************** #

CXXFLAGS := -std=$(CXXSTANDARD) -Wall -Wextra -Werror
LDFLAGS :=

# Build flags
CXXFLAGS_release := -O2
CXXFLAGS_debug := -O0 -g3

# Sanitizer flags
CXXFLAGS_asan := -fsanitize=address
LDFLAGS_asan := -fsanitize=address

CXXFLAGS_ubsan := -fsanitize=undefined
LDFLAGS_ubsan := -fsanitize=undefined

# Debug tools
DEBUG_TOOLS := valgrind lldb

CXXFLAGS += $(CXXFLAGS_$(BUILD))
CXXFLAGS += $(CXXFLAGS_$(SANITIZER))
LDFLAGS  += $(LDFLAGS_$(SANITIZER))

ifneq ($(filter $(SANITIZER),$(DEBUG_TOOLS)),)
	CXXFLAGS += -g3
endif

# ********************************* Rules ************************************ #

all: $(NAME)
.PHONY: all

$(NAME): $(OBJS)
	@$(CXX) $(OBJS) $(LDFLAGS) -o $@
	@$(PRINT) "$(GREEN)$(EMOJI_CHECK) $(NAME) ready. $(RESET)"

# Compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(@D)
	@$(CXX) $(CXXFLAGS) -MMD -MP -c $< -o $@
	@$(PRINT) "$< compiled"

# Include header dependencies
-include $(OBJS:.o=.d)

clean:
	@rm -rf $(OBJ_DIR)
	@$(PRINT) "$(RED)$(EMOJI_BROOM) Object files removed.$(RESET)"
.PHONY: clean

fclean: clean
	@rm -f $(NAME)
	@$(PRINT) "$(RED)$(EMOJI_BROOM) Binaries removed.$(RESET)"

.PHONY: fclean

re: fclean all
.PHONY: re

# ***************************** Style variables ****************************** #

PRINT	= printf "%b\n"

RED		= \033[0;31m
GREEN	= \033[0;32m
YELLOW	= \033[0;33m
BLUE	= \033[0;34m
RESET	= \033[0m

EMOJI_BROOM		= 🧹
EMOJI_CHECK		= ✅
EMOJI_CROSS		= ❌
EMOJI_WRENCH	= 🔧
EMOJI_BOX		= 📦

# ***************************** Makefile config ****************************** #

MAKEFLAGS	+= --no-print-directory
