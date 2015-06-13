#import "UNBControlloPartita.h"
#import "Costanti.h"
#import "UNBUtilita.h"
#import "UNBModello.h"
#import "UNBPartita.h"
#import "UNBRecord.h"
#import "UNBApplicazione.h"

@interface UNBControlloPartita ()

@end

@implementation UNBControlloPartita
@synthesize vistaPartita;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self aggiungiPulsantiMenu];
    [[self vistaPartita] inizializza];
}

- (void) aggiungiPulsantiMenu{
    UIBarButtonItem *barButtonItemVisualizzaRecord = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"star-icon"]
                                                              style:UIBarButtonItemStylePlain
                                                             target:self action:@selector(azioneVisualizzaRecord)];
    UIBarButtonItem *barButtonItemInformazioni = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"info-icon"]
                                                              style:UIBarButtonItemStylePlain
                                                             target:self action:@selector(azioneVisualizzaInformazioni)];
    self.navigationBar.rightBarButtonItems = [[NSArray alloc] initWithObjects:barButtonItemInformazioni, barButtonItemVisualizzaRecord, nil];
}

- (void) azioneVisualizzaRecord{
    int record;
    @try {
        UNBApplicazione* applicazione = [UNBApplicazione instance];
        record = [[applicazione daoRecord] carica];
    } @catch (NSException* daoe) {
        record = 0;
    }
    [[self vistaPartita] finestraRecord:record];
}

- (void) azioneVisualizzaInformazioni{
    [[self vistaPartita] finestraInformazioni];
}

- (IBAction)azioneTenta:(id)sender {
    NSString* stringaTentativo = [vistaPartita stringaTentativo];
    NSString* errori = [self convalida: stringaTentativo];
    if(errori.length > 0){
        [UNBUtilita mostraMessaggio:errori withTitolo:@"Errore"];
        return;
    }
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBModello* modello = [applicazione modello];
    UNBPartita* partita = [modello beanWithKey:PARTITA];
    [partita gestisciTentativo:stringaTentativo.intValue];
    if([partita trovato]){
        int tentativi = [partita numeroDiTentativi];
        [self verificaRecord:tentativi];
        [[self vistaPartita] schermoFinePartita];
    }else{
        [[self vistaPartita] schermoAggiornaPartita];
    }
}

-(void)verificaRecord:(int) tentativi{
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBRecord* record = [[applicazione modello] beanWithKey:RECORD];
    int recordAttuale = [[applicazione daoRecord] carica];
    if(recordAttuale < 1){
        recordAttuale = 101;
    }
    [record checkRecord:tentativi withRecordAttuale:recordAttuale];
    if ([record nuovoRecord]) {
        @try {
            [[applicazione daoRecord] salva:tentativi];
        } @catch (NSException* daoe) {
            NSLog(@"Impossibile salvare il record %@", daoe);
        }
    }
}

- (IBAction)azioneNuovaPartita:(id)sender {
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBPartita* partita = [[applicazione modello] beanWithKey:PARTITA];
    [partita reset];
    [[self vistaPartita] schermoNuovaPartita];
}

- (IBAction)azioneInterrompiPartita:(id)sender {
    [[self vistaPartita] schermoPartitaInterrotta];
}

- (NSString*) convalida: (NSString*) stringaTentativo{
    NSString* errori = @"";
    int tentativo = [stringaTentativo intValue];
    if (tentativo < 1 || tentativo > 100) {
        NSLog(@"Tentativo: %d", tentativo );
        errori = @"Il tentativo deve essere compreso tra 1 e 100";
    }
    return errori;
}

@end
