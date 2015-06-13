#import "UNBVistaIniziale.h"

@implementation UNBVistaIniziale

@synthesize textNome;

- (void) inizializza{
  [[self textNome] becomeFirstResponder];
}

- (NSString*) testoNome{
    return [[self textNome] text];
}

@end
