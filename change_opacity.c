#include <fcntl.h>
#include <stdio.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

#define _GNU_SOURCE
int main(int argc, char *argv[]) {
    if (argc != 2) {
        return 1;
    }

    int b;
    if (argv[1][0] == '-') {
        b = -1;
    } else if (argv[1][0] == '+') {
        b = 1;
    } else
        return 1;

    char path[50];
    const char* homedir = getenv("HOME");
    const char* relative = "/.alacritty.yml";
    strcpy(path, homedir);
    strcpy(path + strlen(homedir), relative);

    int fd = open(path, O_RDWR);
    if (fd < 0) {
        perror("open");
    }

#define SIZE 25
    char buf[SIZE];
    read(fd, &buf, SIZE);
    unsigned index = 0;
    for (; index < SIZE && (buf[index] < '0' || buf[index] > '9'); index++)
        continue;
        
    unsigned unit_index = index;
    char unit = buf[index];
    index += 2;
    char decimal = buf[index];

    if (b < 0) {
        if (unit == '1') {
            unit = '0';
            decimal = '9';
        }
        else {
            decimal += b;
            unit = '0';
            if (decimal < '0')
                decimal = '0';
        }
    } else {
        if (unit == '1') {
            unit = '1';
            decimal = '0';
        } else {
            decimal += b;
            if (decimal > '9') {
                decimal = '0';
                unit = '1';
            }
        }
    }

    buf[index] = decimal;
    buf[unit_index] = unit;

    lseek(fd, 0, SEEK_SET);
    write(fd, &buf, SIZE);
    close(fd);

    return 0;
}
