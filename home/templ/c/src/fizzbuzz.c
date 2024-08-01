#include <stdio.h>
#include <string.h>

typedef struct {
    int divisor;
    char *word;
} fizz_buzz_word;

int main() {
    fizz_buzz_word words[] = {
        {3, "Fizz"},
        {5, "Buzz"},
        {7, "Bazz"},
    };

    int n = 105;

    for (int i = 1; i <= n; i++) {
        char result[64] = {0};

        for (size_t j = 0; j < sizeof(words) / sizeof(words[0]); j++) {
            if (i % words[j].divisor == 0) {
                strcat(result, words[j].word);
            }
        }

        if (result[0] == '\0') {
            printf("%d\n", i);
        }

        else {
            printf("%s\n", result);
        }
    }

    return 0;
}
