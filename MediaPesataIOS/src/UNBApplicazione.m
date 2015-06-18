#import "UNBApplicazione.h"

@interface UNBApplicazione ()

@end

@implementation UNBApplicazione

static UNBApplicazione* singleton = nil;

+ (UNBApplicazione*) instance{
    return singleton;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    singleton = self;
    _modello = [[UNBModelloPersistente alloc] init];
    UNBStudente* studente = [_modello loadPersistentBean: [UNBStudente class] withKey:STUDENTE];
    if(studente == nil){
        NSLog(@"Primo avvio.. Creo lo studente");
        [_modello saveBean:[[UNBStudente alloc] init] withKey:STUDENTE];
    }
    UISplitViewController* splitViewController = (UISplitViewController* )self.window.rootViewController;
    UINavigationController* masterController = [[splitViewController viewControllers] objectAtIndex:0];
    UINavigationController* detailController = [[splitViewController viewControllers] objectAtIndex:1];
    _controlloStudente = [[masterController viewControllers] objectAtIndex:0];
    _controlloEsami = [[detailController viewControllers] objectAtIndex:0];
    //detailController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    return YES;
}
@end
