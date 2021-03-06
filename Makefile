CC = gcc

# -march=bdver1		For AMD FX-4100 processor
# JSMN_PARENT_LINKS=1	Activating fastest mode in JSMN JSON library
CFLAGS = -g -Wall -Wextra -std=c99   -pthread   -Ofast   -fstack-protector -D_FORTIFY_SOURCE=2   -L/usr/lib64/mysql -l mysqlclient -I mysql-connector-c/include   -DJSMN_PARENT_LINKS=1

# the build target executable:
TARGET = fastmorph

all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c jsmn-master/jsmn.c

clean:
	$(RM) $(TARGET) *~ .*~ /tmp/fastmorph.socket


