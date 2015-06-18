#import "UNBControlloPrincipale.h"

@interface UNBControlloPrincipale ()

@end

@implementation UNBControlloPrincipale

- (IBAction)azioneReset:(id)sender {
    [_vistaPrincipale pulisciCampi];
}

- (IBAction)azioneConverti:(id)sender {
    UNBModello* modello = [[UNBApplicazione instance] modello];
    UNBConvertitore* convertitore = [modello beanWithKey:CONVERTITORE];
    NSString* stringa30mi = [_vistaPrincipale valore30mi];
    NSString* stringa110mi = [_vistaPrincipale valore110mi];
    NSString* errori = [self convalidaStringa30mi:stringa30mi
                                  andStringa110mi:stringa110mi];
    if([errori length] > 0){
        [_vistaPrincipale finestraErrori:errori];
        return;
    }
    double valoreConvertito;
    if([stringa30mi length] > 0){
        double valoreOriginale = [stringa30mi doubleValue];
        NSLog(@"Converto il voto in 30mi: %f", valoreOriginale);
        valoreConvertito = [convertitore votoIn110mi:valoreOriginale];
    } else {
        double valoreOriginale = [stringa110mi doubleValue];
        NSLog(@"Converto il voto in 30mi: %f", valoreOriginale);
        valoreConvertito = [convertitore votoIn30mi:valoreOriginale];
    }
    [_vistaPrincipale aggiornaRisultato:valoreConvertito];
}

- (NSString*) convalidaStringa30mi:(NSString*) stringa30mi
                   andStringa110mi:(NSString*) stringa110mi{
    NSMutableString* errori = [[NSMutableString alloc] init];
    if([stringa30mi length] == 0 && [stringa110mi length] == 0){
        [errori appendFormat: @"Inserire il voto in 30mi o in 110mi"];
    }
    if([stringa30mi length] > 0){
        double valore = [stringa30mi doubleValue];
        if(valore < 18 || valore > 30){
            [errori appendFormat: @"Il voto in 30mi dev'essere tra 18 e 30"];
        }
    }
    if([stringa110mi length] > 0){
        double valore = [stringa110mi doubleValue];
        if(valore < 66 || valore > 110){
            [errori appendFormat: @"Il voto in 30mi dev'essere tra 66 e 110"];
        }
    }
    return errori;
}

@end
