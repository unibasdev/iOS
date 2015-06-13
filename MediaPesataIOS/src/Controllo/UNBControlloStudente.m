#import "UNBControlloStudente.h"
#import "UNBApplicazione.h"
#import "UNBModelloPersistente.h"
#import "UNBStudente.h"
#import "UNBUtilita.h"

@interface UNBControlloStudente ()

@end

@implementation UNBControlloStudente
@synthesize vistaStudente;

- (void)viewDidLoad {
    NSLog(@"Creo UNBControlloStudente...");
    [super viewDidLoad];
    [[self vistaStudente] inizializza];
}

- (IBAction)azioneModifica:(id)sender {
    long tag = [sender tag];
    if(tag == MODALITA_VISUALIZZA){
        [[self vistaStudente] modalitaModifica];
    }else{
        UNBApplicazione* applicazione = [UNBApplicazione instance];
        UNBModelloPersistente* modello = [applicazione modello];
        UNBStudente* studente = [modello loadPersistentBean: [UNBStudente class] withKey:STUDENTE];
        NSString* testoCognome = [[vistaStudente testoCognome] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSString* testoNome = [[vistaStudente testoNome] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSString* testoMatricola = [[vistaStudente testoMatricola] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSString* errori = [self validaCognome: testoCognome andNome:testoNome andMatricola:testoMatricola];
        if([errori length] > 0){
            [UNBUtilita mostraMessaggio:errori withTitolo:@"Errore"];
            return;
        }
        [studente setCognome:testoCognome];
        [studente setNome:testoNome];
        [studente setMatricola:[testoMatricola intValue]];
        [[applicazione modello] saveBean:studente withKey:STUDENTE];
        [[self vistaStudente] modalitaVisualizza];
    }
}

- (IBAction)azioneInformazioni:(id)sender {
    [[self vistaStudente] finestraInformazioni];
}

////////////
- (NSString*) validaCognome:(NSString*)cognome andNome:(NSString*)nome andMatricola:(NSString*)stringaMatricola{
    NSMutableString* errori = [[NSMutableString alloc] init];
    if([cognome length]==0){
        [errori appendFormat:@"Il cognome è obbligatorio\n"];
    }
    if([nome length]==0){
        [errori appendFormat:@"Il nome è obbligatorio\n"];
    }
    int matricola = [stringaMatricola intValue];
    if (matricola < 1) {
        [errori appendFormat:@"La matricola dev'essere un valore positivo"];
    }
    return errori;
}

- (void) aggiornaTabellaEsami{
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBControlloEsami* controlloEsami = [applicazione controlloEsami];
    UNBVistaEsami* vistaEsami = [controlloEsami vistaEsami];
    [vistaEsami aggiorna];
}

////////////
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"finestraEsami"]) {
        UINavigationController *navigationController = (UINavigationController*)[[segue destinationViewController] topViewController];
        navigationController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        navigationController.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

@end
