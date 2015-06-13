#import "UNBModelloVistaEsami.h"
#import "UNBEsame.h"
#import "UNBApplicazione.h"

@implementation UNBModelloVistaEsami

-(id) initWithEsami:(NSMutableArray*) esami{
    self = [super init];
    [self setEsami:esami];
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self esami] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UNBEsame* esame = [[self esami] objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rigaEsame" forIndexPath:indexPath];
    [[cell textLabel] setText:[esame insegnamento]];
    [[cell detailTextLabel] setText:[esame shortString]];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UNBApplicazione* applicazione = [UNBApplicazione instance];
        [[applicazione controlloEsami] eliminaEsame:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        UNBVistaStudente* vistaStudente = [[applicazione controlloStudente] vistaStudente];
        [vistaStudente aggiornaMedia];
    }
}

@end
