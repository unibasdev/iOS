#import <Foundation/Foundation.h>
#import "UNBStudente.h"

@interface UNBDAOStudente : NSObject

-(void)salva:(UNBStudente*) studente suFile:(NSString*) nomeFile;
-(UNBStudente*)carica:(NSString*) nomeFile;

@end
