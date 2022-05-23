#include "CacheSim.h"
#include <stdio.h>

/* Posa aqui les teves estructures de dades globals
 * per mantenir la informacio necesaria de la cache
 * */

int hits = 0;
int misses = 0;
int cache[128];

/* La rutina init_cache es cridada pel programa principal per
 * inicialitzar la cache.
 * La cache es inicialitzada al començar cada un dels tests.
 * */
void init_cache ()
{

	for (int i = 0; i < 128; i++) cache[i] = -1;


}

/* La rutina reference es cridada per cada referencia a simular */ 
void reference (unsigned int address, unsigned int LE)
{
	unsigned int byte;
	unsigned int bloque_m; 
	unsigned int linea_mc;
	unsigned int tag;
	unsigned int miss;	   // boolea que ens indica si es miss
	unsigned int replacement;  // boolea que indica si es reemplaça una linia valida
	unsigned int tag_out;	   // TAG de la linia reemplaçada
	unsigned int lec_mp = 0;
    unsigned int mida_lec_mp;
    unsigned int esc_mp = 0;
    unsigned int mida_esc_mp;		

	/* Escriu aqui el teu codi */
	byte = address%32;
	bloque_m = address/32;
	linea_mc = bloque_m%128;
	tag = bloque_m/128;
	miss = 0;
	replacement = 0;

	if(LE == lectura){
		if(cache[linea_mc] == tag) ++hits;
		else {
		    miss = 1;
		    if (cache[linea_mc] != -1) {
				tag_out = cache[linea_mc];
				replacement = 1;
		    }
		    cache[linea_mc] = tag;
	 	    ++misses;
	 	    lec_mp = 1;
	 	    mida_lec_mp = 32;
		}
	}
	else{
		esc_mp = 1;
		mida_esc_mp = 1;
		if(cache[linea_mc] == tag) ++hits;
		else {
		    miss = 1;
 	    	++misses;
		}
	}

	/* La funcio test_and_print escriu el resultat de la teva simulacio
	 * per pantalla (si s'escau) i comproba si hi ha algun error
	 * per la referencia actual. També mesurem el temps d'execució
	 * */
	test_and_print (address, LE, byte, bloque_m, linea_mc, tag,
            miss, lec_mp, mida_lec_mp, esc_mp, mida_esc_mp,
            replacement, tag_out);
}

/* La rutina final es cridada al final de la simulacio */ 
void final ()
{
 	printf("%d, %d\n", hits, misses); 
  
  
}
