#import <UIKit/UIKit.h>
#import "UNBEsame.h"

@interface UNBVistaEsame : UITableView{
@private
    BOOL modifica;
    NSDateFormatter *dateFormatter;
}
@property (weak, nonatomic) IBOutlet UITextField *testoInsegnamento;
@property (weak, nonatomic) IBOutlet UISlider *sliderCrediti;
@property (weak, nonatomic) IBOutlet UILabel *testoCrediti;
@property (weak, nonatomic) IBOutlet UISlider *sliderVoto;
@property (weak, nonatomic) IBOutlet UILabel *testoVoto;
@property (weak, nonatomic) IBOutlet UISwitch *switchLode;
@property (weak, nonatomic) IBOutlet UILabel *labelData;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerData;
@property (weak, nonatomic) IBOutlet UITableViewCell *rigaData;

-(void) inizializza;
- (void) modalitaModifica;
- (void) modalitaVisualizza;

-(NSString*) insegnamento;
-(int) crediti;
-(int) voto;
-(BOOL) lode;
-(NSDate*) dataRegistrazione;

@end
