#include <stdio.h>
#include <stdlib.h>

/* Will be stored in bss */
int val;

int main(int argc, char **argv, char **envp)
{
    if(argc != 2)
    {
        printf("Usage: ./test {integer}\n");
        return 1;
    }

    val = atoi(argv[1]);
    printf("You entered: %d\n", val);
	return 0;
}
