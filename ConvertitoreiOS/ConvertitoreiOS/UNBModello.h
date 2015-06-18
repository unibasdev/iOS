#import <UIKit/UIKit.h>

@interface UNBModello : NSObject

@property NSMutableDictionary* beans;

- (void) putBean:(NSObject*) bean
         withKey:(NSString*) key;

- (id) beanWithKey:(NSString*) key;

@end
