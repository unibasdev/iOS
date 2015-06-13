#import "UNBGioco.h"
#import "Costanti.h"

@implementation UNBGioco

- (void) gestisciPartita:(UNBPartita*)partita{
    assert ([partita stato] != PARTITAINCORSO);
    if ([partita stato] == PARTITAVINTADALCOMPUTER) {
        _partiteVinteDalComputer++;
    } else if ([partita stato] == PARTITAVINTADALGIOCATORE) {
        _partiteVinteDalGiocatore++;
    }
}

@end