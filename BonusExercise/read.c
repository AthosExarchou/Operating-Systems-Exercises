//it2022134 EXARCHOU ATHANASIOS

//included libraries
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>
#include <dirent.h>
#include <string.h>
#include <unistd.h>

extern int errno; //indicates whether something went wrong

int main (int argc, char *argv[]) {

    int i; //counter for the for-loops
    char *c = NULL; //represents the buffer (initialized at NULL)
    int fd;

    fd = open(argv[1], O_RDONLY, 00400); //opens the file

    //checks for errors
    if (fd == -1) {
        //informs the user via appropriate message
        printf("There was an error during the process of opening the requested file. Exiting...\n");
        abort(); //exits the program
    }

    c = (char *) malloc (1000 * sizeof(char)); //allocates needed memory

    //checks for errors
    if (c == NULL) {
        //informs the user via appropriate message
        printf("There was an error during the process of memory allocation. Exiting...\n");
        close(fd); //closes the file before exiting
        abort(); //exits the program
    }
    
    //sequential pattern:

    if (strcmp(argv[2], "sequential") == 0) {

    //1000 repetitions(reads 1000 bytes from the file descriptor)
    for (i = 1; i < 1000; i++) {
        read(fd, c, 1);
        printf("%s", c);
    }
    printf("\n");
    }
    //irregular pattern:
    else if (strcmp(argv[2], "irregular") == 0) {

    for (i = 0; i < 500; i++) { //500 repetitions

        lseek(fd, i, SEEK_SET); //seeks to the start of the file descriptor
        read(fd, c, 1);
        printf("%c", *c);
        lseek(fd, -i-2, SEEK_END); //seeks to the end of the file descriptor
        read(fd, c, 1);
        printf("%c", *c);
    }
    printf("\n");
    }
    //case where the pattern is invalid:
    else {
        printf("Invalid pattern! Exiting...\n"); //informs the user via appropriate message
        abort(); //exits the program
    }

    close(fd); //closes the file
    free(c); //deallocates the previously allocated space

    return 0; //exits once the program has finished executing succesfully
}