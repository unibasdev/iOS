#import <UIKit/UIKit.h>
#import "UNBModelloPersistente.h"
#import "Costanti.h"
#import "UNBStudente.h"
#import "UNBControlloStudente.h"
#import "UNBControlloEsame.h"
#import "UNBControlloEsami.h"

@interface UNBApplicazione : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain) UNBModelloPersistente* modello;
@property (retain) UNBControlloStudente* controlloStudente;
@property (retain) UNBControlloEsami* controlloEsami;

+ (UNBApplicazione*) instance;

@end

