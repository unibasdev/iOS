#import "UNBApplicazione.h"

@interface UNBApplicazione ()

@end

@implementation UNBApplicazione

static UNBApplicazione *singleton = nil;

+ (UNBApplicazione*) instance{
    return singleton;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    singleton = self;
    _modello = [[UNBModello alloc] init];
    _daoRecord = [[UNBDAORecord alloc] init];
   return YES;
}

@end
