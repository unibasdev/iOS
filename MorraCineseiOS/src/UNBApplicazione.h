#import <UIKit/UIKit.h>
#import "UNBModello.h"
#import "Costanti.h"

@interface UNBApplicazione : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain) UNBModello* modello;

+ (UNBApplicazione*) instance;

@end

