#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface UNBModelloPersistente : NSObject

@property (retain) NSDictionary* cache;

- (void) saveBean:(JSONModel*) bean
          withKey:(NSString*)key;

- (id) loadPersistentBean:(Class) type
              withKey:(NSString *)key;

@end
