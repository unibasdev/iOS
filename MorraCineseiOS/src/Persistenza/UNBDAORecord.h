#import <Foundation/Foundation.h>

@interface UNBDAORecord : NSObject

@property (copy) NSString* nomeFileRecord;

-(int) carica;
-(void) salva:(int)record;
-(void) cancella;

@end
