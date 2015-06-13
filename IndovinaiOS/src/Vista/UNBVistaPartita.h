#import <UIKit/UIKit.h>

@interface UNBVistaPartita : UITableView


@property (weak, nonatomic) IBOutlet UITextField *textTentativo;
@property (weak, nonatomic) IBOutlet UIButton *bottoneTentativo;
@property (weak, nonatomic) IBOutlet UIButton *bottoneNuovaPartita;
@property (weak, nonatomic) IBOutlet UIButton *bottoneInterrompiPartita;
@property (weak, nonatomic) IBOutlet UILabel *labelMessaggio1;
@property (weak, nonatomic) IBOutlet UILabel *labelMessaggio2;

- (void) inizializza;
-(NSString*) stringaTentativo;

-(void)schermoAggiornaPartita;
-(void)schermoNuovaPartita;
-(void)schermoFinePartita;
-(void)schermoPartitaInterrotta;
-(void) finestraRecord:(int)record;
-(void) finestraInformazioni;

@end
