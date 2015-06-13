#import <UIKit/UIKit.h>

@interface UNBModelloVistaEsami : NSObject<UITableViewDataSource>{
}

@property NSMutableArray* esami;

-(id) initWithEsami:(NSMutableArray*) esami;

@end
