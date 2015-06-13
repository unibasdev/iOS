#import <Foundation/Foundation.h>

@interface UNBRecord : NSObject 

@property bool nuovoRecord;
@property bool uguagliato;

- (void)checkRecord:(int)tentativi withRecordAttuale:(int)recordAttuale;

@end