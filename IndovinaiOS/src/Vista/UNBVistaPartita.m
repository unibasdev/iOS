#import "UNBVistaPartita.h"
#import "UNBApplicazione.h"
#import "UNBRecord.h"
#import "UNBPartita.h"
#import "UNBUtilita.h"

@implementation UNBVistaPartita

- (void) inizializza{
    [[self textTentativo] becomeFirstResponder];
    [self schermoNuovaPartita];
}

-(NSString*) stringaTentativo{
    return [[self textTentativo] text];
}

///////////// SCHERMI
-(void)schermoAggiornaPartita{
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBPartita* partita = [[applicazione modello] beanWithKey:PARTITA];
    [[self textTentativo] setText:@""];
    [[self labelMessaggio1] setText:[partita suggerimento]];
    [[self labelMessaggio2] setText:[NSString stringWithFormat:NSLocalizedString(@"MESSAGGIO_TENTATIVI", nil),[partita numeroDiTentativi]]];
}

-(void)schermoNuovaPartita {
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBPartita* partita = [[applicazione modello] beanWithKey:PARTITA];
    [[self textTentativo] setText:@""];
    [[self labelMessaggio1] setText:[NSString stringWithFormat:NSLocalizedString(@"MESSAGGIO_BENVENUTO", nil),[partita nome]]];
    [[self labelMessaggio2] setText:[NSString stringWithFormat:NSLocalizedString(@"MESSAGGIO_TENTATIVI", nil),[partita numeroDiTentativi]]];
    [[self bottoneNuovaPartita] setEnabled:FALSE];
    [[self bottoneInterrompiPartita] setEnabled:TRUE];
    [[self bottoneTentativo] setEnabled:TRUE];
    
}

-(void)schermoFinePartita {
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBPartita* partita = [[applicazione modello] beanWithKey:PARTITA];
    UNBRecord* record = [[applicazione modello] beanWithKey:RECORD];
    [[self labelMessaggio1] setText:[NSString stringWithFormat:NSLocalizedString(@"NUMEROINDOVINATO", nil),[partita nome], [partita numeroDiTentativi]]];
    if ([record uguagliato]) {
        [[self labelMessaggio2] setText:NSLocalizedString(@"RECORDUGUAGLIATO", nil)];
    } else if ([record nuovoRecord]) {
        [[self labelMessaggio2] setText:NSLocalizedString(@"NUOVORECORD", nil)];
    }
    [[self bottoneNuovaPartita] setEnabled:TRUE];
    [[self bottoneInterrompiPartita] setEnabled:FALSE];
    [[self bottoneTentativo] setEnabled:FALSE];
}

-(void)schermoPartitaInterrotta {
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBPartita* partita = [[applicazione modello] beanWithKey:PARTITA];
    [[self textTentativo] setText:@""];
    [[self labelMessaggio1] setText:[NSString stringWithFormat:NSLocalizedString(@"NUMERONONINDOVINATO", nil),[partita nome], [partita numeroDaIndovinare]]];
    [[self labelMessaggio2] setText:[NSString stringWithFormat:NSLocalizedString(@"MESSAGGIO_TENTATIVI", nil),[partita numeroDiTentativi]]];
    [[self bottoneNuovaPartita] setEnabled:TRUE];
    [[self bottoneInterrompiPartita] setEnabled:FALSE];
    [[self bottoneTentativo] setEnabled:FALSE];
}

-(void) finestraRecord:(int)record{
    NSString* messaggio;
    if (record > 0) {
        messaggio = [NSString stringWithFormat:NSLocalizedString(@"ATTUALERECORD", nil),record];
    } else {
        messaggio = NSLocalizedString(@"RECORDNONSTABILITO", nil);
    }
    [UNBUtilita mostraMessaggio:messaggio withTitolo:@"Record"];
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
