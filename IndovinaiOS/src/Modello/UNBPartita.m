#import "UNBPartita.h"
#include <stdlib.h>

@implementation UNBPartita

- (id)init {
	self = [super init];
    [self reset];
	return self;
}

-(void) reset {
    srand(time(NULL));
    _numeroDaIndovinare = rand() % 100 + 1;
    //numeroDaIndovinare = arc4random_uniform(100) + 1;
    NSLog(@"Ho scelto il numero %d", _numeroDaIndovinare);
    _numeroDiTentativi = 0;
    _trovato = false;
    _suggerimento = @"Ho scelto un numero da 1 e 100. Prova a indovinarlo";
}

-(void)gestisciTentativo:(int)tentativo {
    if (tentativo < 1 || tentativo > 100) {
        [NSException raise:@"Valore scorretto" format:@"Il valore deve essere compreso tra 1 e 100"];
    }
    _numeroDiTentativi++;
    if (tentativo == _numeroDaIndovinare) {
        _trovato = true;
        _suggerimento = @"Numero indovinato!";
    } else if (tentativo < _numeroDaIndovinare) {
        _suggerimento = @"Prova con un numero piu' alto";
    } else if (tentativo > _numeroDaIndovinare) {
        _suggerimento = @"Prova con un numero piu' basso";
    }
}

- (NSString*)description {
	NSMutableString* result = [[NSMutableString alloc] init];
	[result appendFormat:@"Partita----------------:\n"];
	[result appendFormat:@"Numero da indovinare: %d\n", _numeroDaIndovinare];
	[result appendFormat:@"Tentativi effettuati: %d\n", _numeroDiTentativi];
	[result appendFormat:@"Indovinato: %d\n", _trovato];
	[result appendFormat:@"Attuale suggerimento: %@\n", _suggerimento];
	return result;
}

@end