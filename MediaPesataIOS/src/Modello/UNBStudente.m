#import "UNBStudente.h"
#import "UNBEsame.h"

@implementation UNBStudente

-(id)init{
	self = [super init];
	_listaEsami = [[NSMutableArray alloc] init];
	return self;
}

-(void)addEsame:(NSString*)insegnamento withVoto:(int)voto andLode:(bool)lode andCrediti:(int)crediti andDataRegistrazione:(NSDate*)data{
	UNBEsame* esame = [[UNBEsame alloc] init];
	[esame setInsegnamento:insegnamento];
	[esame setVoto:voto];
    [esame setLode:lode];
    [esame setCrediti:crediti];
    [esame setDataRegistrazione:data];
	[_listaEsami addObject:esame];
}

-(void)addEsame:(UNBEsame*)esame{
	[_listaEsami addObject:esame];
}

-(int)numeroEsami{
	return (int)[_listaEsami count];
}

-(UNBEsame*)esame:(int)pos{
    if (pos < 0 || pos >= [_listaEsami count]) {
        [NSException raise:NSRangeException format: @"La posizione %d non è valida", pos];
    }
	return [_listaEsami objectAtIndex:pos];
}

-(double)creditiTotali{
    int sommaCrediti = 0;
    for(UNBEsame* esame in _listaEsami){
        sommaCrediti += [esame crediti];
    }
    return sommaCrediti;
}

-(double)mediaPesata30mi{
    if ([_listaEsami count] == 0) {
        [NSException raise:NSInvalidArgumentException format: @"Non e' possibile calcolare la media di 0 esami"];
    }
    int sommaVotiPesati = 0;
    int sommaCrediti = 0;
    for(UNBEsame* esame in _listaEsami){
        sommaVotiPesati += [esame voto] * [esame crediti];
        sommaCrediti += [esame crediti];
    }
    return ((double)sommaVotiPesati)/sommaCrediti;
}

-(double)mediaPesata110mi{
    return ((double)[self mediaPesata30mi])/30 * 110;
}

- (NSString*)description {
    NSMutableString* result = [[NSMutableString alloc] init];
    [result appendFormat:@"Nome: %@\n", _nome];
    [result appendFormat:@"Cognome: %@\n", _cognome];
    [result appendFormat:@"Matricola: %d\n", _matricola];
    [result appendFormat:@"Esami sostenuti: %d\n", [self numeroEsami]];
    return result;
}

- (NSString*)saveString {
	NSMutableString* result = [[NSMutableString alloc] init];
	[result appendFormat:@"%@|%@|%d\n", _nome, _cognome, _matricola];
	return result;
}

@end