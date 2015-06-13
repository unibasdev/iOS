#import <UIKit/UIKit.h>
#import "UNBModello.h"
#import "Costanti.h"
#import "UNBDAORecord.h"

@interface UNBApplicazione : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow* window;
@property (retain) UNBModello* modello;
@property (retain) UNBDAORecord* daoRecord;


+ (UNBApplicazione*) instance;

@end

