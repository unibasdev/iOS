#import "UNBVistaEsami.h"
#import "UNBApplicazione.h"
#import "UNBModelloPersistente.h"
#import "UNBStudente.h"
#import "Costanti.h"

@implementation UNBVistaEsami


-(void) aggiorna{
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBModelloPersistente* modello = [applicazione modello];
    UNBStudente* studente = [modello loadPersistentBean: [UNBStudente class] withKey:STUDENTE];
    [self setModelloTabella:[[UNBModelloVistaEsami alloc] initWithEsami:[studente listaEsami]]];
    [self setDataSource:[self modelloTabella]];
    [self reloadData];
}

-(UNBEsame*) esameSelezionato{
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBModelloPersistente* modello = [applicazione modello];
    UNBStudente* studente = [modello loadPersistentBean: [UNBStudente class] withKey:STUDENTE];
    UNBEsame* esameSelezionato = nil;
    if([self indexPathForSelectedRow]){
        esameSelezionato = [[studente listaEsami] objectAtIndex:[[self indexPathForSelectedRow] row]];
    }
    return esameSelezionato;
}

@end
