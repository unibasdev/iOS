#import "UNBApplicazione.h"
#import "UNBGioco.h"
#import "Costanti.h"

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
    UNBGioco* gioco = [[UNBGioco alloc] init];
    [_modello putBean:gioco withKey:GIOCO];
    return YES;
}

@end
