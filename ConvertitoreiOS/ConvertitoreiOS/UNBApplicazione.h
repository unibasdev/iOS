#import <UIKit/UIKit.h>
#import "UNBModello.h"

@interface UNBApplicazione : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property UNBModello* modello;

+ (UNBApplicazione*) instance;

@end

