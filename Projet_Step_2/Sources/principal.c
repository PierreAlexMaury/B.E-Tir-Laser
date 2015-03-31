#include "gassp72.h"

extern short int Rayon(int i);
extern int Partie (short int * signal, int k, short int * tab);
extern int M2k (short int * signal, int k);
//int=32bits 
int resultat[64];
extern short int TabCos[]; 
extern short int TabSin[];
extern short int LeSignal[];
extern short int LeSignaltest[];

int main(void)
{

	//ATTENTION après l'execution on lit 3FFF ou 4000 penser au format 2.14 pour l'interprétation
	// 00.11..11111 ou 01.00...000 => 0,99...999 ou 1,0
	//for (i=0;i<64;i++){
	//Rayon(i);
	//} //resultat[i]=Rayon(i) : inutile car nous faisons l'affectation en assembleur avec str (choix entre str en ASM et '=' en c)
	
	//Partie(LeSignaltest,0,TabCos);	
	M2k(LeSignal,2);
	
	while (1);
	

}

