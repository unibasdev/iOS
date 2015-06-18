#import <UIKit/UIKit.h>

@interface UNBVistaPrincipale : UIView

@property (weak, nonatomic) IBOutlet UITextField *campo30mi;
@property (weak, nonatomic) IBOutlet UITextField *campo110mi;
@property (weak, nonatomic) IBOutlet UILabel *testoRisultato;

- (void) aggiornaRisultato:(double) risultato;
- (NSString*) valore30mi;
- (NSString*) valore110mi;

- (void) pulisciCampi;
- (void) finestraErrori:(NSString*) errore;

@end
