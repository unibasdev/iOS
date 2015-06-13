#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol UNBEsame @end

@interface UNBEsame : JSONModel 

@property (copy) NSString* insegnamento;
@property int voto;
@property bool lode;
@property int crediti;
@property NSDate* dataRegistrazione;

- (NSString*)saveString;
- (NSString*)shortString;
@end