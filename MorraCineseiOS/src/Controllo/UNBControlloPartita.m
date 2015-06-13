#import "UNBControlloPartita.h"
#import "Costanti.h"
#import "UNBUtilita.h"
#import "UNBModello.h"
#import "UNBPartita.h"
#import "UNBGioco.h"
#import "UNBMano.h"
#import "UNBApplicazione.h"

@interface UNBControlloPartita ()

@end

@implementation UNBControlloPartita
@synthesize vistaPartita;

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self vistaPartita] inizializza];
}

- (IBAction)azioneVisualizzaInformazioni:(id)sender {
    [[self vistaPartita] finestraInformazioni];
}

- (IBAction)azioneNuovaPartita:(id)sender {
    UNBPartita* partita = [[UNBPartita alloc] init];
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBModello* modello = [applicazione modello];
    [modello putBean:partita withKey:PARTITA];
    [[self vistaPartita] schermoInizialePartita];
}

- (IBAction)azioneInterrompiPartita:(id)sender {
    [[self vistaPartita] schermoPartitaInterrotta];
}

- (IBAction)azioneGioca:(id)sender {
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBModello* modello = [applicazione modello];
    UNBPartita* partita = [modello beanWithKey:PARTITA];
    int giocata = (int)[sender tag];
    UNBMano* mano = [partita giocaMano:giocata];
    [modello putBean:mano withKey:MANO];
    [[self vistaPartita] schermoPartita];
    if ([partita stato] != PARTITAINCORSO) {
        UNBGioco* gioco = [modello beanWithKey:GIOCO];
        [gioco gestisciPartita:partita];
        [[self vistaPartita] schermoFinePartita];
    }
}

@end
