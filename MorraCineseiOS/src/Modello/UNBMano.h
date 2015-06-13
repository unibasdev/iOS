#import <Foundation/Foundation.h>

@interface UNBMano : NSObject

@property int giocataGiocatore;
@property (readonly) int giocataComputer;

- (void) gioca: (int) giocataGiocatore;
- (bool) isValida: (int) giocata;
- (void) generaGiocataComputer;
- (int) esito;

@end