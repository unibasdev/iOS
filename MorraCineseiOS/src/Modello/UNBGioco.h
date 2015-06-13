#import <Foundation/Foundation.h>
#import "UNBPartita.h"

@interface UNBGioco : NSObject

@property (copy) NSString* nomeGiocatore;
@property int partiteVinteDalComputer;
@property int partiteVinteDalGiocatore;

- (void) gestisciPartita:(UNBPartita*)partita;

@end