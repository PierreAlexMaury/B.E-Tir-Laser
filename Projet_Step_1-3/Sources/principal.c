#include "gassp72.h"
#include "etat.h" 

void Temporisation (int a);
void Generateur (int a);
void timer_callback (void);
type_etat etat_tache;
extern int LongueurSon;
extern int PeriodeSonMicroSec;
extern int* Son;
int periode_pwm = 360; // kiloH multiple de 72 mega sachant que fréquence pwm=200kH (rapport des deux)


int main(void)
{
// activation de la PLL qui multiplie la fréquence du quartz par 9
CLOCK_Configure();
// config port PB0 pour être utilisé en sortie
GPIO_Configure(GPIOB, 0, OUTPUT, ALT_PPULL);
	
	
	// config TIM3-CH3 en mode PWM
	etat_tache.resolution = PWM_Init_ff( TIM3, 3, periode_pwm  );//periode_pwm>>20khz
	etat_tache.position=0;
	etat_tache.taille=LongueurSon;
	etat_tache.son=&Son;
	
	
	Timer_1234_Init_ff( TIM4, 6573 );
	Active_IT_Debordement_Timer( TIM4, 2, timer_callback );
	Run_Timer( TIM4 );
	
	while (1);
	
}
