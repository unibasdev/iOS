#import "UNBControlloEsame.h"
#import "UNBApplicazione.h"
#import "UNBUtilita.h"

@interface UNBControlloEsame ()

@end

@implementation UNBControlloEsame

- (void)viewDidLoad {
    NSLog(@"Creo UNBControlloEsame...");
    [super viewDidLoad];
    [[self vistaEsame] inizializza];
}

- (IBAction)azioneIniziaModifica:(id)sender{
    [[self bottoneBarraMostraEsami] setTitle:@"Fine"];
    [[self bottoneBarraMostraEsami] setAction:@selector(azioneFineModifica:)];
    [[self vistaEsame] modalitaModifica];
}

- (IBAction)azioneFineModifica:(id)sender {
    NSString* insegnamento = [[[self vistaEsame] insegnamento] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    int crediti = [[self vistaEsame] crediti];
    int voto = [[self vistaEsame] voto];
    BOOL lode = [[self vistaEsame] lode];
    NSDate* dataRegistrazione = [[self vistaEsame] dataRegistrazione];
    NSString* errori = [self convalidaInsegnamento:insegnamento andCrediti:crediti andVoto:voto andLode:lode];
    if(errori.length>0){
        [UNBUtilita mostraMessaggio:errori withTitolo:@"Errore"];
        return;
    }
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBEsame* esame = [[applicazione modello] loadPersistentBean: [UNBEsame class] withKey:ESAME];
    [esame setInsegnamento:insegnamento];
    [esame setVoto:voto];
    [esame setLode:lode];
    [esame setCrediti:crediti];
    [esame setDataRegistrazione:dataRegistrazione];
    [[self bottoneBarraMostraEsami] setTitle:@"Modifica"];
    [[self bottoneBarraMostraEsami] setAction:@selector(azioneIniziaModifica:)];
    [[self vistaEsame] modalitaVisualizza];
    UNBStudente* studente = [[applicazione modello] loadPersistentBean: [UNBStudente class] withKey:STUDENTE];
    [[applicazione modello] saveBean:studente withKey:STUDENTE];
    UNBVistaStudente* vistaStudente = [[applicazione controlloStudente] vistaStudente];
    [vistaStudente aggiornaMedia];
}

- (IBAction)azioneAggiungiEsame:(id)sender {
    NSString* insegnamento = [[[self vistaEsame] insegnamento] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    int crediti = [[self vistaEsame] crediti];
    int voto = [[self vistaEsame] voto];
    BOOL lode = [[self vistaEsame] lode];
    NSDate* dataRegistrazione = [[self vistaEsame] dataRegistrazione];
    NSString* errori = [self convalidaInsegnamento:insegnamento andCrediti:crediti andVoto:voto andLode:lode];
    if(errori.length>0){
        [UNBUtilita mostraMessaggio:errori withTitolo:@"Errore"];
        return;
    }
    UNBApplicazione* applicazione = [UNBApplicazione instance];
    UNBStudente* studente = [[applicazione modello] loadPersistentBean: [UNBStudente class] withKey:STUDENTE];
    [studente addEsame:insegnamento withVoto:voto andLode:lode andCrediti:crediti andDataRegistrazione:dataRegistrazione];
    [[applicazione modello] saveBean:studente withKey:STUDENTE];
    UNBVistaStudente* vistaStudente = [[applicazione controlloStudente] vistaStudente];
    [vistaStudente aggiornaMedia];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)azioneAnnulla:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSString*) convalidaInsegnamento:(NSString*)insegnamento andCrediti:(int)crediti andVoto:(int)voto andLode:(BOOL)lode{
    NSMutableString* errori = [[NSMutableString alloc] init];
    if(insegnamento.length==0){
        [errori appendFormat:@"L'insegnamento è obbligatorio"];
    }
    if(voto != 30 && lode){
        [errori appendFormat:@"La lode è consentita solo con voto 30"];
    }
    return errori;
}

@end
