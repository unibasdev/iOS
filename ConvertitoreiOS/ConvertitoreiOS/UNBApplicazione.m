#import "UNBApplicazione.h"
#import "UNBCostanti.h"
#import "UNBConvertitore.h"

@interface UNBApplicazione ()

@end

@implementation UNBApplicazione

static UNBApplicazione* _singleton;

+ (UNBApplicazione*) instance{
    return _singleton;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _singleton = self;
    _modello = [[UNBModello alloc] init];
    UNBConvertitore* convertitore = [[UNBConvertitore alloc] init];
    [_modello putBean:convertitore withKey:CONVERTITORE];
    return YES;
}

@end
