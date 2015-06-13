#import <Foundation/Foundation.h>

@interface UNBPartita : NSObject

@property (copy) NSString* nome;
@property int numeroDaIndovinare;
@property int numeroDiTentativi;
@property bool trovato;
@property (copy) NSString* suggerimento;

-(void)gestisciTentativo:(int)tentativo;
-(void)reset;

@end