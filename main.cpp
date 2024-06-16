#include <cstdio>
#include <iostream>
#include "base64.hpp"

#define BUFF_SIZE   3

void usage(const char *progname);


int main(int argc, char **argv) {
    FILE *fp;

    if (argc != 2)
        fp = stdin;
    else
        fp = std::fopen(argv[1], "rb");

    if (fp == NULL) {
        usage(argv[0]);
        return 1;
    }

    size_t read;
    char buff[BUFF_SIZE];

    while ((read = std::fread(buff, sizeof(char), BUFF_SIZE, fp)))
        std::cout << base64::encode(buff, read, base64::BS64Mode::NORMAL);

    if (fp)
        fclose(fp);
    return 0;
}


void usage(const char *progname) {
    std::cerr << "Usage: " << progname << " <file>" << std::endl;
}
