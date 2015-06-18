#import "UNBVistaPrincipale.h"

@implementation UNBVistaPrincipale


- (void) aggiornaRisultato:(double) risultato{
    NSLog(@"Risultato: %f", risultato);
    [_testoRisultato setText:[NSString stringWithFormat:@"Risultato convertito: %f", risultato]];
}

- (NSString*) valore30mi{
    return [_campo30mi text];
}

- (NSString*) valore110mi{
    return [_campo110mi text];
}

- (void) pulisciCampi{
    [_campo30mi setText:@""];
    [_campo110mi setText:@""];
    [_testoRisultato setText:[NSString stringWithFormat:@"Inserisci il valore da convertire"]];
}

- (void) finestraErrori:(NSString*) errore{
    NSLog(@"Errore: %@", errore);
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle: @"Errore"
                                                       message:errore
                                                      delegate:nil
                                             cancelButtonTitle:nil
                                             otherButtonTitles:@"Ok", nil];
    [alertView show];
}

@end
