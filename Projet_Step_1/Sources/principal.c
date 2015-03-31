#include "gassp72.h"
void Temporisation (int a);
void Generateur (int a);
void timer_callback (void);
int etat=0;

int main(void)
{
// activation de la PLL qui multiplie la fréquence du quartz par 9
CLOCK_Configure();
// config port PB1 pour être utilisé en sortie
GPIO_Configure(GPIOB, 1, OUTPUT, OUTPUT_PPULL);
	Timer_1234_Init_ff( TIM4, 1000000 );
	Active_IT_Debordement_Timer( TIM4, 2, timer_callback );
	Run_Timer( TIM4 );
	while (1);
}
