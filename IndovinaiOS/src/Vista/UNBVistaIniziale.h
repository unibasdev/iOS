#import <UIKit/UIKit.h>

@interface UNBVistaIniziale : UITableView

@property (weak, nonatomic) IBOutlet UITextField *textNome;

- (void) inizializza;
- (NSString*) testoNome;

@end
