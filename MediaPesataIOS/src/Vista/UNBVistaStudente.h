#import <UIKit/UIKit.h>

@interface UNBVistaStudente : UITableView

@property (weak, nonatomic) IBOutlet UITextField *textCognome;

@property (weak, nonatomic) IBOutlet UITextField *textNome;
@property (weak, nonatomic) IBOutlet UITextField *textMatricola;

@property (weak, nonatomic) IBOutlet UIButton *bottoneModificaStudente;
@property (weak, nonatomic) IBOutlet UILabel *labelCrediti;
@property (weak, nonatomic) IBOutlet UILabel *labelMedia30mi;
@property (weak, nonatomic) IBOutlet UILabel *labelMedia110mi;

- (void) inizializza;
- (void) modalitaModifica;
- (void) modalitaVisualizza;
- (void) schermoStudente;
- (void) aggiornaMedia;

- (NSString*) testoNome;
- (NSString*) testoCognome;
- (NSString*) testoMatricola;

-(void) finestraInformazioni;
@end
