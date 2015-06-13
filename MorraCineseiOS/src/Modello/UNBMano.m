#import "UNBMano.h"
#import "Costanti.h"

@implementation UNBMano

- (void) gioca:(int)giocataGiocatore {
    assert([self isValida:giocataGiocatore]);
    [self setGiocataGiocatore:giocataGiocatore];
    [self generaGiocataComputer];
}

- (bool) isValida: (int) giocata {
    return (giocata >= CARTA && giocata <= SASSO);
}

- (void) generaGiocataComputer {
    _giocataComputer = rand() % 3 + 1;
}

-(int) esito {
    int esito = MANOVINTADALCOMPUTER;
    if (_giocataGiocatore == _giocataComputer) {
        esito = MANOINPAREGGIO;
    } else if ((_giocataGiocatore == CARTA) && (_giocataComputer == SASSO)) {
        esito = MANOVINTADALGIOCATORE;
    } else if ((_giocataGiocatore == FORBICI) && (_giocataComputer == CARTA)) {
        esito = MANOVINTADALGIOCATORE;
    } else if ((_giocataGiocatore == SASSO) && (_giocataComputer == FORBICI)) {
        esito = MANOVINTADALGIOCATORE;
    }
    return esito;
}

@end