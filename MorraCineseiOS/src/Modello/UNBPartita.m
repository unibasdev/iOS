#import "UNBPartita.h"
#import "Costanti.h"

@implementation UNBPartita

-(UNBMano*)giocaMano:(int)giocata{
    assert([self stato] == PARTITAINCORSO);
    NSLog(@"Creo mano...");
    UNBMano* mano = [[UNBMano alloc] init];
    [mano gioca:giocata];
    int esito = [mano esito];
    if (esito == MANOVINTADALCOMPUTER) {
        _maniVinteDalComputer++;
    } else if (esito == MANOVINTADALGIOCATORE) {
        _maniVinteDalGiocatore++;
    } else if (esito == MANOINPAREGGIO) {
        _pareggi++;
    }
    return mano;
}

-(int)stato{
    int stato = PARTITAINCORSO;
    if (_maniVinteDalComputer == LIMITEMANI) {
        stato = PARTITAVINTADALCOMPUTER;
    } else if (_maniVinteDalGiocatore == LIMITEMANI) {
        stato = PARTITAVINTADALGIOCATORE;
    }
    return stato;
}


@end