#import "UNBModello.h"

@implementation UNBModello

-(id) init {
    self = [super init];
    _mappaBean = [[NSMutableDictionary alloc] init];
    return self;
}

- (void) putBean:(NSObject *)bean withKey:(NSString *)key {
    [_mappaBean setValue:bean forKey:key];
}

- (id) beanWithKey:(NSString *)key {
    return [_mappaBean objectForKey:key];
}


@end
