#import "UNBUtilita.h"

@implementation UNBUtilita

+(void) mostraMessaggio:(NSString*) messaggio withTitolo:(NSString*) titolo{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle: titolo
                                                       message:messaggio
                                                      delegate:nil
                                             cancelButtonTitle:nil
                                             otherButtonTitles:@"Ok", nil];
    [alertView show];
}

@end
