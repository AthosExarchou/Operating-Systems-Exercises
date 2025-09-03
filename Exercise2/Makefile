# Makefile for Exercise 2 - Operating Systems Course
# Author: Athanasios Exarchou (it2022134)

CC = gcc
CFLAGS = -Wall -Wextra -O2 -pthread
TARGET = exercise2
SRC = exercise2.c

.PHONY: all clean run

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET) data.txt
