#include "fct1.h"
#include "sec_fct1.h"

int sec_fct1(int a) {
    /* I have added comments */
    return 3*a;
}

int fct1(int x) {
    /* I have added more comments */
    return 2*x + sec_fct1(x);
}

