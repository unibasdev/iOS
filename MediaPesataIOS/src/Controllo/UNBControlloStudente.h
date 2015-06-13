#import <UIKit/UIKit.h>
#import "UNBVistaStudente.h"
#import "UNBVistaEsami.h"

@interface UNBControlloStudente : UITableViewController

@property (strong, nonatomic) IBOutlet UNBVistaStudente* vistaStudente;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bottoneBarraModifica;

@end
