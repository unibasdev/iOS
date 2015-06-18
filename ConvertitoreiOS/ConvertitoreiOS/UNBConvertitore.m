#import "UNBConvertitore.h"

@implementation UNBConvertitore


-(double) votoIn30mi:(double) voto{
    return voto * 30 / 110.0;
}

-(double) votoIn110mi:(double) voto{
    return voto * 110 / 30.0;
}

@end
