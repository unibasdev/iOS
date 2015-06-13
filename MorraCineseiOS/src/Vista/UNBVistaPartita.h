#import <UIKit/UIKit.h>

@interface UNBVistaPartita : UITableView

@property (weak, nonatomic) IBOutlet UILabel *labelPartiteVinteGiocatore;
@property (weak, nonatomic) IBOutlet UILabel *labelPartiteVinteComputer;
@property (weak, nonatomic) IBOutlet UILabel *labelManiVinteGiocatore;
@property (weak, nonatomic) IBOutlet UILabel *labelManiVinteComputer;
@property (weak, nonatomic) IBOutlet UILabel *labelPareggi;
@property (weak, nonatomic) IBOutlet UILabel *labelMessaggioPartita;
@property (weak, nonatomic) IBOutlet UILabel *labelMessaggioMano;

@property (weak, nonatomic) IBOutlet UIButton *bottoneIniziaPartita;
@property (weak, nonatomic) IBOutlet UIButton *bottoneInterrompiPartita;
@property (weak, nonatomic) IBOutlet UIButton *bottoneCarta;
@property (weak, nonatomic) IBOutlet UIButton *bottoneForbici;
@property (weak, nonatomic) IBOutlet UIButton *bottoneSasso;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewGiocataGiocatore;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewGiocataComputer;

- (void) inizializza;
- (void) finestraInformazioni;
- (void) schermoInizialePartita;
- (void) schermoPartitaInterrotta;
- (void) schermoPartita;
- (void) schermoFinePartita;

-(void) abilitaBottoniStatoNoPartita;
-(void) abilitaBottoniStatoPartita;

@end
