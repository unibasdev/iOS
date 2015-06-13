#import "UNBModello.h"

@implementation UNBModello

@synthesize mappaBean;

-(id) init{
    self = [super init];
    mappaBean = [[NSMutableDictionary alloc] init];
    return self;
}

- (void) putBean:(NSString*) nome withObject:(NSObject*)bean{
    [[self mappaBean] setValue:bean forKey:nome];
}

- (id) getBean:(NSString*) nome{
    return [[self mappaBean] objectForKey:nome];
}


@end
