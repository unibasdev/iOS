#import "UNBRecord.h"

@implementation UNBRecord {
    NSString* nomeFileRecord;
}

- (void)checkRecord:(int)tentativi withRecordAttuale:(int)recordAttuale {
    _nuovoRecord = false;
    _uguagliato = false;
    if (tentativi < recordAttuale) {
        _nuovoRecord = true;
    } else if (tentativi == recordAttuale) {
        _uguagliato = true;
    }
}

@end