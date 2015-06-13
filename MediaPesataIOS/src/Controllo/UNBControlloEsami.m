#import "UNBControlloEsami.h"
#import "UNBApplicazione.h"
#import "UNBControlloEsame.h"

@interface UNBControlloEsami ()

@end

@implementation UNBControlloEsami

- (void)viewDidLoad {
    NSLog(@"Creo UNBControlloEsami...");
    [super viewDidLoad];
    [self aggiungiPulsantiMenu];
}

-(void) viewWillAppear:(BOOL)animated{
    [[self vistaEsami] aggiorna];
}

- (void) aggiungiPulsantiMenu{
    UIBarButtonItem* modificaButtonItem = [self editButtonItem];
    UIBarButtonItem* aggiungiButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add-icon"]
                                                                                  style:UIBarButtonItemStylePlain
                                                                                 target:self action:@selector(azioneAggiungi)];
    [[self navigationItem] setRightBarButtonItems:[[NSArray alloc] initWithObjects:aggiungiButtonItem, modificaButtonItem, nil]];
}

-(void) azioneAggiungi{
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBEsame* nuovoEsame = [[UNBEsame alloc] init];
    [nuovoEsame setVoto:25];
    [nuovoEsame setLode:FALSE];
    [nuovoEsame setCrediti:6];
    [nuovoEsame setDataRegistrazione:[NSDate date]];
    [[applicazione modello] saveBean:nuovoEsame withKey:ESAME];
    [self performSegueWithIdentifier:@"finestraNuovoEsame" sender:nil];
}

-(void) mostraFinestraEsame{
    [self performSegueWithIdentifier:@"finestraEsame" sender:nil];
}

-(void) eliminaEsame: (NSInteger) pos{
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBModelloPersistente* modello = [applicazione modello];
    UNBStudente* studente = [modello loadPersistentBean: [UNBStudente class] withKey:STUDENTE];
    [[studente listaEsami] removeObjectAtIndex:pos];
    [[applicazione modello] saveBean:studente withKey:STUDENTE];
}

#pragma gestori tabella
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UNBEsame* esameSelezionato = [[self vistaEsami] esameSelezionato];
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    [[applicazione modello] saveBean:esameSelezionato withKey:ESAME];
    [self mostraFinestraEsame];
}

@end
