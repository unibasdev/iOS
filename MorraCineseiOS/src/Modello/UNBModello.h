#import <Foundation/Foundation.h>

@interface UNBModello : NSObject

@property (retain) NSDictionary* mappaBean;

- (void) putBean:(NSObject*)bean
         withKey:(NSString*)key;

- (id) beanWithKey:(NSString*)key;

@end
