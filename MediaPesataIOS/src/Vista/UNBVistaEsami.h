#import <UIKit/UIKit.h>
#import "UNBModelloVistaEsami.h"
#import "UNBEsame.h"

@interface UNBVistaEsami : UITableView

@property (strong) UNBModelloVistaEsami* modelloTabella;

-(void) aggiorna;
-(UNBEsame*) esameSelezionato;

@end
