#import "UNBDAORecord.h"

@implementation UNBDAORecord
@synthesize nomeFileRecord;

-(id)init {
    self = [super init];
    NSArray *cartelle = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cartellaDocuments = [cartelle objectAtIndex:0];
    self.nomeFileRecord = [cartellaDocuments stringByAppendingPathComponent:@"recordIndovina.txt"];
    return self;
}

-(int) carica{
    int valoreRecord;
    NSError *errore;
    NSString *contenuto = [NSString stringWithContentsOfFile:nomeFileRecord encoding:NSUnicodeStringEncoding error:&errore];
    if (contenuto) {
        return [contenuto intValue];
    } else{
        [NSException raise:@"PersistenceException" format: @"Errore nella lettura del file del record. %@", [errore localizedFailureReason]];
    }
    return valoreRecord;
}

-(void) salva:(int)record{
    if (record < 1) {
        [NSException raise:NSInvalidArgumentException format:@"Valore scorretto %d", record];
    }
    NSString* contenuto = [[NSString alloc] initWithFormat:@"%d", record];
    NSError *errore;
    NSLog(@"Salvo il record %@ sul file %@", contenuto, nomeFileRecord);
    BOOL successo = [contenuto writeToFile:nomeFileRecord atomically:YES encoding:NSUnicodeStringEncoding error:&errore];
    if (!successo) {
        NSLog(@"Errore nella scrittura del record. %@", [errore localizedFailureReason]);
        [NSException raise:@"PersistenceException" format: @"Errore nella scrittura del record. %@", [errore localizedFailureReason]];
    }
}

-(void) cancella{
    NSFileManager *filemgr = [NSFileManager defaultManager];
    NSError *errore;
    bool successo = [filemgr removeItemAtPath: nomeFileRecord error:&errore];
    if(!successo){
        NSLog(@"Impossibile cancellare il file %@", [errore localizedFailureReason]);
        [NSException raise:@"PersistenceException" format: @"Impossibile cancellare il file. %@", [errore localizedFailureReason]];
    }
    return;
}

@end
