#import "UNBVistaEsame.h"
#import "UNBApplicazione.h"

@implementation UNBVistaEsame

-(void) inizializza{
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBEsame* esame = [[applicazione modello] loadPersistentBean: [UNBStudente class] withKey:ESAME];
    [[self testoInsegnamento] setText:[esame insegnamento]];
    [[self sliderCrediti] setValue:[esame crediti]];
    [[self testoCrediti] setText:[NSString stringWithFormat:@"%d", [esame crediti]]];
    [[self sliderVoto] setValue:[esame voto]];
    [[self testoVoto] setText:[NSString stringWithFormat:@"%d", [esame voto]]];
    [[self switchLode] setOn:[esame lode]];
    [[self labelData] setText:[dateFormatter stringFromDate:[esame dataRegistrazione]]];
}

- (void) modalitaModifica{
    [[self testoInsegnamento] setUserInteractionEnabled:TRUE];
    [[self testoInsegnamento] setTextAlignment:NSTextAlignmentLeft];
    //[[self testoInsegnamento] becomeFirstResponder];
    [[self sliderCrediti] setUserInteractionEnabled:TRUE];
    [[self testoCrediti] setUserInteractionEnabled:TRUE];
    [[self sliderVoto] setUserInteractionEnabled:TRUE];
    [[self testoVoto] setUserInteractionEnabled:TRUE];
    [[self switchLode] setUserInteractionEnabled:TRUE];
    [[self sliderCrediti] setHidden:FALSE];
    [[self sliderVoto] setHidden:FALSE];
    [[self datePickerData] setHidden:FALSE];
    [[self rigaData] setHidden:FALSE];
}

- (void) modalitaVisualizza{
    [[self testoInsegnamento] setUserInteractionEnabled:FALSE];
    [[self testoInsegnamento] setTextAlignment:NSTextAlignmentRight];
    [[self sliderCrediti] setUserInteractionEnabled:FALSE];
    [[self testoCrediti] setUserInteractionEnabled:FALSE];
    [[self sliderVoto] setUserInteractionEnabled:FALSE];
    [[self testoVoto] setUserInteractionEnabled:FALSE];
    [[self switchLode] setUserInteractionEnabled:FALSE];
    [[self sliderCrediti] setHidden:TRUE];
    [[self sliderVoto] setHidden:TRUE];
    [[self datePickerData] setHidden:TRUE];
    [[self rigaData] setHidden:TRUE];
}
- (IBAction)aggiornaLabelCrediti:(id)sender {
    [[self testoCrediti] setText:[NSString stringWithFormat:@"%d", [self crediti]]];
}

- (IBAction)aggiornaLabelVoto:(id)sender {
    [[self testoVoto] setText:[NSString stringWithFormat:@"%d", [self voto]]];
}
- (IBAction)aggiornaLabelData:(id)sender {
    NSDate *data = [[self datePickerData] date];
    [[self labelData] setText:[dateFormatter stringFromDate:data]];
}

-(NSString*) insegnamento{
    return [[self testoInsegnamento] text];
}

-(int) crediti{
    return [[self sliderCrediti] value];
}

-(int) voto{
    return [[self sliderVoto] value];
}

-(BOOL) lode{
    return [[self switchLode] isOn];
}

-(NSDate*) dataRegistrazione{
    return [[self datePickerData] date];
}

@end
