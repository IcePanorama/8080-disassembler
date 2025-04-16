CC=g++

TARGET = 8080Disassembler

CPP_STD=c++20
CPP_FLAGS = -std=$(CPP_STD) -Werror -Wall -Wextra -Wpedantic -Wuninitialized
CPP_FLAGS += -Wmissing-include-dirs -Wshadow -Wundef -Winvalid-pch
CPP_FLAGS += -Wzero-as-null-pointer-constant -Wctor-dtor-privacy
CPP_FLAGS += -Wold-style-cast -Woverloaded-virtual

LEAK_CHKR = valgrind
LEAK_CHK_FLAGS = --leak-check=yes

AUTO_FMT = clang-format
FMT_STYLE = gnu
FMT_FLAGS = -style=$(FMT_STYLE)

SRC_DIR = src
INCL_DIR = include

SRC_FILES = $(SRC_DIR)/main.cpp

all: clean format $(TARGET)
full: all leak-check

$(TARGET):
	$(CC) $(CPP_FLAGS) -o $(TARGET) $(SRC_FILES) -I./$(INCL)/

clean:
	-@rm vgcore.* 2>/dev/null || true
	-@rm *.o 2>/dev/null || true
	-@rm $(TARGET) 2>/dev/null || true

leak-check: $(TARGET)
	$(LEAK_CHKR) $(LEAK_CHK_FLAGS) ./$(TARGET)

format:
	$(AUTO_FMT) $(FMT_FLAGS) -i $(SRC_FILES) $(INCL_FILES)
