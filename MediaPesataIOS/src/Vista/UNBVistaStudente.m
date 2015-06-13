#import "UNBVistaStudente.h"
#import "UNBApplicazione.h"
#import "UNBModelloPersistente.h"
#import "UNBStudente.h"
#import "UNBUtilita.h"

@implementation UNBVistaStudente

- (void) inizializza{
    [self schermoStudente];
    //[self modalitaModifica];
}

- (NSString*) testoNome{
    return [[self textNome] text];
}

- (NSString*) testoCognome{
    return [[self textCognome] text];
}

- (NSString*) testoMatricola{
    return [[self textMatricola] text];
}

- (void) schermoStudente{
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBModelloPersistente* modello = [applicazione modello];
    UNBStudente* studente = [modello loadPersistentBean: [UNBStudente class] withKey:STUDENTE];
    [[self textCognome] setText:[studente cognome]];
    [[self textNome] setText:[studente nome]];
    [[self textMatricola] setText:[[NSString alloc] initWithFormat:@"%d", [studente matricola]]];
    [self aggiornaMedia];
}

- (void) aggiornaMedia{
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBModelloPersistente* modello = [applicazione modello];
    UNBStudente* studente = [modello loadPersistentBean: [UNBStudente class] withKey:STUDENTE];
    if(studente != nil && [studente numeroEsami]>0){
        [[self labelCrediti] setText:[[NSString alloc] initWithFormat:@"%f", [studente creditiTotali]]];
        [[self labelMedia30mi] setText:[[NSString alloc] initWithFormat:@"%f", [studente mediaPesata30mi]]];
        [[self labelMedia110mi] setText:[[NSString alloc] initWithFormat:@"%f", [studente mediaPesata110mi]]];
    }else{
        [[self labelCrediti] setText:@"0"];
        [[self labelMedia30mi] setText:@"0.0"];
        [[self labelMedia110mi] setText:@"0.0"];
    }
}

- (void) modalitaModifica{
    [[self bottoneModificaStudente] setTitle:@"Conferma Modifiche" forState:UIControlStateNormal];
    [[self bottoneModificaStudente] setTag:MODALITA_MODIFICA];
    [[self textCognome] setUserInteractionEnabled:TRUE];
    [[self textNome] setUserInteractionEnabled:TRUE];
    [[self textMatricola] setUserInteractionEnabled:TRUE];
    [[self textCognome] becomeFirstResponder];
}

- (void) modalitaVisualizza{
    [[self bottoneModificaStudente] setTitle:@"Modifica" forState:UIControlStateNormal];
    [[self bottoneModificaStudente] setTag:MODALITA_VISUALIZZA];
    [[self textCognome] setUserInteractionEnabled:FALSE];
    [[self textNome] setUserInteractionEnabled:FALSE];
    [[self textMatricola] setUserInteractionEnabled:FALSE];
}

-(void) finestraInformazioni{
    NSMutableString* messaggio = [[NSMutableString alloc] init];
    [messaggio appendString:@"Esempio sviluppato a scopo didattico\n"];
    [messaggio appendString:@"\n"];
    [messaggio appendString:@"Corso di Laurea in Informatica\n"];
    [messaggio appendString:@"Università della Basilicata\n"];
    [messaggio appendString:@"donatello.santoro@unibas.it\n"];
    [messaggio appendString:@"giansalvatore.mecca@unibas.it\n"];
    [UNBUtilita mostraMessaggio:messaggio withTitolo:@"Informazioni"];
}

@end
