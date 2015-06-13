#import <Foundation/Foundation.h>

@interface UNBModello : NSObject {
@private
    NSDictionary* mappaBean;
}

@property (retain) NSDictionary* mappaBean;

- (void) putBean:(NSString*) nome withObject:(NSObject*)bean;
- (id) getBean:(NSString*) nome;

@end
