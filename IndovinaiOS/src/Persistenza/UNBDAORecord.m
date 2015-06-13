#import "UNBDAORecord.h"

@implementation UNBDAORecord

-(int) carica{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults integerForKey:@"record"];
}

-(void) salva:(int)record{
    if (record < 1) {
        [NSException raise:NSInvalidArgumentException format:@"Valore scorretto %d", record];
    }
    NSLog(@"Salvo il record %d...", record);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:record forKey:@"record"];
    [defaults synchronize];
    NSLog(@"Record salvato correttamente");
}

@end
