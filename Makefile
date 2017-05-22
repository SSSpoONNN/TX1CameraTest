CC = gcc
XX = g++
CFLAGS = -Wall -Wfatal-errors 
LDFLAGS = `pkg-config --libs opencv` 
COMMON = `pkg-config --cflags opencv` 

OBJS = camera.o
EXEC = camera
DEPS = camera.h

all : $(EXEC)

.PHONY: clean

clean:
	rm -rf $(OBJS) $(EXEC)

$(EXEC): $(OBJS)
	$(CC) $(COMMON) $(CFLAGS) $^ -o $@ $(LDFLAGS)

$(OBJS): $(EXEC).c $(DEPS)
	$(CC) $(COMMON) $(CFLAGS) -c $< -o $@