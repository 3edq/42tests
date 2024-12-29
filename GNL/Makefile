
CC = cc
CFLAGS = -Wall -Wextra -Werror

BUFFER_SIZE = 42

SRCS = get_next_line.c get_next_line_utils.c main.c
OBJS = $(SRCS:.c=.o)

TARGET = gnl_test

VALGRIND_LOG = valgrind_log.txt

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -D BUFFER_SIZE=$(BUFFER_SIZE) -o $(TARGET) $(OBJS)

%.o: %.c get_next_line.h
	$(CC) $(CFLAGS) -D BUFFER_SIZE=$(BUFFER_SIZE) -c $< -o $@

run: $(TARGET)
	./$(TARGET)

valgrind: $(TARGET)
	valgrind --leak-check=full --log-file=$(VALGRIND_LOG) ./$(TARGET)
	@echo "Valgrind log saved to $(VALGRIND_LOG)"

clean:
	rm -f $(OBJS) $(TARGET) $(VALGRIND_LOG)

re: clean all
