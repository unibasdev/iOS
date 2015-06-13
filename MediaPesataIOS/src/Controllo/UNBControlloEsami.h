#import <UIKit/UIKit.h>
#import "UNBVistaEsami.h"

@interface UNBControlloEsami : UITableViewController

@property (strong, nonatomic) IBOutlet UNBVistaEsami *vistaEsami;

-(void) eliminaEsame: (NSInteger) pos;

@end
