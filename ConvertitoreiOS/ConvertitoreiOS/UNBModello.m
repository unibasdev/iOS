#import "UNBModello.h"

@implementation UNBModello

- (id) init{
    self = [super init];
    _beans = [[NSMutableDictionary alloc] init];
    return self;
}

- (void) putBean:(NSObject*) bean
         withKey:(NSString*) key{
    [_beans setValue:bean forKey:key];
}

- (id) beanWithKey:(NSString*) key{
    return [_beans objectForKey:key];
}

@end
