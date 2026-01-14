/*
 * H8/3664 blink program
 */

#define PCR8 (*((volatile unsigned char *)0xffeb))
#define PDR8 (*((volatile unsigned char *)0xffdb))

void msecwait(int msec)
{
    int i,j;
    for (i=0;i<msec;i++) {
        for (j=0;j<1588;j++);
    }
}

int main()
{
    PCR8=0x80;
    while (1) {
        PDR8=0x80;
        msecwait(500);
        PDR8=0x00;
        msecwait(500);
    }
}


