#import <Foundation/Foundation.h>
#import "UNBEsame.h"
#import "JSONModel.h"

@interface UNBStudente : JSONModel

@property (copy) NSString* nome;
@property (copy) NSString* cognome;
@property int matricola;
@property NSMutableArray<UNBEsame>* listaEsami;

-(void) addEsame:(NSString*)insegnamento
        withVoto:(int)voto
         andLode:(bool)lode
     andCrediti:(int)crediti
andDataRegistrazione:(NSDate*)data;

-(void) addEsame:(UNBEsame*)esame;

-(int) numeroEsami;

-(double) creditiTotali;

-(double) mediaPesata30mi;

-(double) mediaPesata110mi;

-(UNBEsame*) esame:(int)pos;
-(NSString*) saveString;
@end