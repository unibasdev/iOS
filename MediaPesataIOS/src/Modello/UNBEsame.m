#import "UNBEsame.h"

@implementation UNBEsame


- (NSString*)description {
    NSMutableString* result = [[NSMutableString alloc] init];
    [result appendFormat:@"Esame di %@", _insegnamento];
    [result appendFormat:@" (%d CFU)", _crediti];
    [result appendFormat:@" - voto: %d", _voto];
    if(_lode){
        [result appendFormat:@" e lode"];
    }
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    [df setDateStyle:NSDateFormatterMediumStyle];
    [df setTimeStyle:NSDateFormatterNoStyle];
    [result appendFormat:@" - Registrato il: %@", [df stringFromDate:_dataRegistrazione]];
    return result;
}

- (NSString*)shortString {
    NSMutableString* result = [[NSMutableString alloc] init];
    [result appendFormat:@"Voto: %d", _voto];
    [result appendFormat:@" (%d CFU)", _crediti];
    if(_lode){
        [result appendFormat:@" e lode"];
    }
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    [df setDateStyle:NSDateFormatterMediumStyle];
    [df setTimeStyle:NSDateFormatterNoStyle];
    [result appendFormat:@" - Registrato il: %@", [df stringFromDate:_dataRegistrazione]];
    return result;
}

- (NSString*)saveString {
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    [df setDateStyle:NSDateFormatterShortStyle];
    [df setTimeStyle:NSDateFormatterNoStyle];
	NSMutableString* result = [[NSMutableString alloc] init];
	[result appendFormat:@"%@|%d|%d|%@|",
		_insegnamento, _voto, _crediti, [df stringFromDate:_dataRegistrazione]];
	if(_lode){
		[result appendString:@"true"];
	}else{
		[result appendString:@"false"];
	}
	[result appendString:@"\n"];
	return result;
}


@end