#import "UNBDAOStudente.h"
#import "UNBEsame.h"

@implementation UNBDAOStudente

-(void)salva:(UNBStudente*) studente suFile:(NSString*) nomeFile {
    NSArray *cartelle = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cartellaDocuments = [cartelle objectAtIndex:0];
    NSString* percorsoCompleto = [cartellaDocuments stringByAppendingPathComponent:nomeFile];
    NSLog(@"Salvo studente %@ sul file %@", studente, percorsoCompleto);
    NSMutableString* contenuto = [[NSMutableString alloc] init];
    [contenuto appendString:[studente saveString]];
    for(UNBEsame* esame in [studente listaEsami]){
        NSLog(@"Salvo esame %@", [esame description]);
        [contenuto appendString:[esame saveString]];
    }
    NSError* errore;
    BOOL successo = [contenuto writeToFile:percorsoCompleto atomically:YES encoding:NSUnicodeStringEncoding error:&errore];
    if (!successo) {
        NSLog(@"Errore nella scrittura dello studente. %@", [errore localizedFailureReason]);
        [NSException raise:@"PersistenceException" format: @"Errore nella scrittura dello studente. %@", [errore localizedFailureReason]];
    }
}


-(UNBStudente*)carica:(NSString*) nomeFile {
    NSArray *cartelle = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cartellaDocuments = [cartelle objectAtIndex:0];
    NSString* percorsoCompleto = [cartellaDocuments stringByAppendingPathComponent:nomeFile];
    NSLog(@"Leggo file da %@", percorsoCompleto);
    UNBStudente* studente = [[UNBStudente alloc] init];
    NSError* errore;
    NSString* contenuto = [NSString stringWithContentsOfFile:percorsoCompleto encoding:NSUnicodeStringEncoding error:&errore];
    if (contenuto) {
        NSArray* linee = [contenuto componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        NSString* lineaStudente = [linee objectAtIndex:0];
        [self estraiDatiStudente:lineaStudente forStudente: studente];
        for(int i = 1; i < [linee count]; i++){
            NSString* lineaStudente = [linee objectAtIndex:i];
            if([lineaStudente length] == 0){
                continue;
            }
            UNBEsame* esame = [self estraiDatiEsame:lineaStudente];
            [studente addEsame:esame];
        }
    } else{
        NSLog(@"Errore nella lettura del file. %@", [errore localizedFailureReason]);
        [NSException raise:@"PersistenceException" format: @"Errore nella lettura dello studente. %@", [errore localizedFailureReason]];
    }
    return studente;
}

-(void)estraiDatiStudente:(NSString*) linea forStudente:(UNBStudente*) studente {
    NSArray* tokens = [linea componentsSeparatedByString:@"|"];
    if([tokens count] != 3){
        [NSException raise:NSInvalidArgumentException format: @"La linea dello studente deve contenere 3 elementi. Linea letta '%@' ", linea];
    }
    [studente setNome:[tokens objectAtIndex:0]];
    [studente setCognome:[tokens objectAtIndex:1]];
    [studente setMatricola:[[tokens objectAtIndex:2] intValue]];
}

-(UNBEsame*)estraiDatiEsame:(NSString*) linea {
    NSArray* tokens = [linea componentsSeparatedByString:@"|"];
    if([tokens count] != 5){
        [NSException raise:NSInvalidArgumentException format: @"La linea dell'esame deve contenere 5 elementi. Linea letta '%@' ", linea];
    }
    UNBEsame* esame = [[UNBEsame alloc] init];
    [esame setInsegnamento:[tokens objectAtIndex:0]];
    [esame setVoto:[[tokens objectAtIndex:1] intValue]];
    [esame setCrediti:[[tokens objectAtIndex:2] intValue]];
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    [df setDateStyle:NSDateFormatterShortStyle];
    [df setTimeStyle:NSDateFormatterNoStyle];
    [esame setDataRegistrazione:[df dateFromString:[tokens objectAtIndex:3]]];
    [esame setLode:[[tokens objectAtIndex:4] boolValue]];
    NSLog(@"Letto esame %@", [esame description]);
    return esame;
}

@end
