#import "UNBVistaPartita.h"
#import "UNBApplicazione.h"
#import "UNBPartita.h"
#import "UNBGioco.h"
#import "UNBUtilita.h"

@implementation UNBVistaPartita

- (void) inizializza{
    [self schermoIniziale];
}

///////////// SCHERMI

-(void)schermoIniziale {
    [self abilitaBottoniStatoNoPartita];
    [[self labelMessaggioPartita] setText:NSLocalizedString(@"BENVENUTO", nil)];
    [[self labelMessaggioMano] setText:NSLocalizedString(@"USAIBOTTONIPERINIZIARE", nil)];
    [[self imageViewGiocataGiocatore] setImage:CARTA1];
    [[self imageViewGiocataComputer] setImage:FORBICI2];
}


-(void)schermoInizialePartita {
    [self abilitaBottoniStatoPartita];
    [[self labelMessaggioPartita] setText:NSLocalizedString(@"PARTITAINCORSO", nil)];
    [[self labelMessaggioMano] setText:NSLocalizedString(@"SCEGLIGIOCATA", nil)];
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBModello* modello = [applicazione modello];
    UNBPartita* partita = [modello beanWithKey:PARTITA];
    [[self labelManiVinteGiocatore] setText:[NSString stringWithFormat:@"%d", [partita maniVinteDalGiocatore]]];
    [[self labelManiVinteComputer] setText:[NSString stringWithFormat:@"%d", [partita maniVinteDalComputer]]];
    [[self labelPareggi] setText:[NSString stringWithFormat:@"%d", [partita pareggi]]];
    [[self imageViewGiocataGiocatore] setImage:VUOTA];
    [[self imageViewGiocataComputer] setImage:VUOTA];
}

-(void)schermoPartita {
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBModello* modello = [applicazione modello];
    UNBPartita* partita = [modello beanWithKey:PARTITA];
    UNBMano* mano = [modello beanWithKey:MANO];
    [[self labelManiVinteGiocatore] setText:[NSString stringWithFormat:@"%d", [partita maniVinteDalGiocatore]]];
    [[self labelManiVinteComputer] setText:[NSString stringWithFormat:@"%d", [partita maniVinteDalComputer]]];
    [[self labelPareggi] setText:[NSString stringWithFormat:@"%d", [partita pareggi]]];
    [self cambiaIcone:mano];
    [[self labelMessaggioPartita] setText:NSLocalizedString(@"PARTITAINCORSO", nil)];
    if ([mano esito] == MANOVINTADALGIOCATORE) {
        [[self labelMessaggioMano] setText:NSLocalizedString(@"HAIVINTOLAMANO", nil)];
    } else if ([mano esito] == MANOVINTADALCOMPUTER) {
        [[self labelMessaggioMano] setText:NSLocalizedString(@"PURTROPPOHAIPERSOLAMANO", nil)];
    } else if ([mano esito] == MANOINPAREGGIO) {
        [[self labelMessaggioMano] setText:NSLocalizedString(@"SIEVERIFICATOUNPAREGGIO", nil)];
    }
}

-(void)cambiaIcone:(UNBMano*) mano {
    [[self imageViewGiocataGiocatore] setImage:[self iconaGiocataGiocatore:[mano giocataGiocatore]]];
    [[self imageViewGiocataComputer] setImage:[self iconaGiocataComputer:[mano giocataComputer]]];
}

-(void)schermoPartitaInterrotta {
    [self abilitaBottoniStatoNoPartita];
    [[self labelMessaggioPartita] setText:NSLocalizedString(@"PARTITAINTERROTTA", nil)];
    [[self labelMessaggioMano] setText:NSLocalizedString(@"INIZIANUOVAPARTITA", nil)];
}

-(void)schermoFinePartita {
    [self abilitaBottoniStatoNoPartita];
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBModello* modello = [applicazione modello];
    UNBPartita* partita = [modello beanWithKey:PARTITA];
    [[self labelMessaggioPartita] setText:NSLocalizedString(@"PARTITACONCLUSA", nil)];
    if ([partita stato] == PARTITAVINTADALGIOCATORE) {
        [[self labelMessaggioMano] setText:NSLocalizedString(@"BRAVOHAIVINTOLAPARTITA", nil)];
    } else if ([partita stato] == PARTITAVINTADALCOMPUTER) {
        [[self labelMessaggioMano] setText:NSLocalizedString(@"PARTITAVINTADALCOMPUTER", nil)];
    }
    UNBGioco* gioco = [modello beanWithKey:GIOCO];
    [[self labelPartiteVinteGiocatore] setText:[NSString stringWithFormat:@"%d", [gioco partiteVinteDalGiocatore]]];
    [[self labelPartiteVinteComputer] setText:[NSString stringWithFormat:@"%d", [gioco partiteVinteDalComputer]]];
}

-(void) abilitaBottoniStatoNoPartita {
    [[self bottoneIniziaPartita] setEnabled:TRUE];
    [[self bottoneInterrompiPartita] setEnabled:FALSE];
    [[self bottoneCarta] setEnabled:FALSE];
    [[self bottoneForbici] setEnabled:FALSE];
    [[self bottoneSasso] setEnabled:FALSE];
}

-(void) abilitaBottoniStatoPartita {
    [[self bottoneIniziaPartita] setEnabled:FALSE];
    [[self bottoneInterrompiPartita] setEnabled:TRUE];
    [[self bottoneCarta] setEnabled:TRUE];
    [[self bottoneForbici] setEnabled:TRUE];
    [[self bottoneSasso] setEnabled:TRUE];
}

-(UIImage*) iconaGiocataGiocatore:(int) giocata {
    if (giocata == CARTA) {
        return CARTA1;
    }
    if (giocata == FORBICI) {
        return FORBICI1;
    }
    return SASSO1;
}

-(UIImage*) iconaGiocataComputer:(int) giocata {
    if (giocata == CARTA) {
        return CARTA2;
    }
    if (giocata == FORBICI) {
        return FORBICI2;
    }
    return SASSO2;
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
