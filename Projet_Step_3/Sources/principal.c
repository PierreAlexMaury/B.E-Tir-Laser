#include "gassp72.h"

int main(void)
{
// activation de la PLL qui multiplie la fr�quence du quartz par 9
CLOCK_Configure();
// config port PB1 pour �tre utilis� en sortie
GPIO_Configure(GPIOB, 1, OUTPUT, OUTPUT_PPULL);
}
