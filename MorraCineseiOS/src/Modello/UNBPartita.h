#import <Foundation/Foundation.h>
#include "UNBMano.h"

@interface UNBPartita : NSObject 

@property (readonly) int maniVinteDalComputer;
@property (readonly) int maniVinteDalGiocatore;
@property (readonly) int pareggi;

-(int) stato;
-(UNBMano*)giocaMano:(int)giocata;

@end