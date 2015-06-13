#import "UNBControlloIniziale.h"
#import "UNBUtilita.h"
#import "UNBPartita.h"
#import "UNBRecord.h"
#import "UNBApplicazione.h"

@interface UNBControlloIniziale ()

@end

@implementation UNBControlloIniziale

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self vistaIniziale] inizializza];
}

- (IBAction)azioneIniziaGioco:(id)sender {
    NSString* nome = [[self vistaIniziale] testoNome];
    nome = [nome stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSLog(@"Nome del giocatore: %@", nome);
    if([nome length] == 0){
        NSString* messaggio = @"E' necessario inserire il nome";
        [UNBUtilita mostraMessaggio:messaggio withTitolo:@"Errore"];
        return;
    }
    //UNBApplicazione* applicazione = [[UIApplication sharedApplication] delegate];
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBModello* modello = [applicazione modello];
    UNBPartita* partita = [[UNBPartita alloc] init];
    [partita setNome:nome];
    UNBRecord* record = [[UNBRecord alloc] init];
    [modello putBean:partita withKey:PARTITA];
    [modello putBean:record withKey:RECORD];
    [self performSegueWithIdentifier:@"schermoAvviaGioco" sender:sender];
}

@end
