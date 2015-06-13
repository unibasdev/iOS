#import "UNBModelloPersistente.h"

@implementation UNBModelloPersistente

-(id) init{
    self = [super init];
    _cache = [[NSMutableDictionary alloc] init];
    return self;
}

- (void) saveBean:(JSONModel*) bean withKey:(NSString*)key {
    [[self cache] setValue:bean forKey:key];
    [self save:bean withKey:key];
}

- (id) loadPersistentBean:(Class) type withKey:(NSString *)key {
    JSONModel* cachedObject = [_cache objectForKey:key];
    if(cachedObject != nil){
        return cachedObject;
    }
    cachedObject = [self load:type withKey:key];
    if(cachedObject == nil){
        return nil;
    }
    [_cache setValue:cachedObject forKey:key];
    NSLog(@"Loaded object\n%@",[cachedObject description]);
    return cachedObject;
}

-(void) save:(JSONModel*) bean withKey:(NSString*)key{
    NSString* jsonString = [bean toJSONString];
    NSLog(@"Saving object\n%@", jsonString);
    NSString* filePath = [self fileNameForKey:key];
    NSLog(@"Writing object in file %@", filePath);
    NSError* error;
    BOOL success = [jsonString writeToFile:filePath
                                atomically:YES
                                  encoding:NSUnicodeStringEncoding
                                     error:&error];
    if (!success) {
        NSLog(@"Error while saving object. %@", [error localizedFailureReason]);
        [NSException raise:@"PersistenceException" format: @"Error while saving object. %@", [error localizedFailureReason]];
    }
}

-(id) load:(Class) type withKey:(NSString *)key {
    NSString* filePath = [self fileNameForKey:key];
    NSLog(@"Loading object from file %@", filePath);
    NSError* error;
    NSString* jsonString = [NSString stringWithContentsOfFile:filePath
                                                     encoding:NSUnicodeStringEncoding
                                                        error:&error];
    if (!jsonString) {
        NSLog(@"Error: %@", error);
        return nil;
    }
    return [[type alloc] initWithString:jsonString error:&error];
}

-(NSString*) fileNameForKey:(NSString*) key{
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString* filePath = [[NSString alloc] initWithFormat:@"%@/%@.json",documentDirectory, key];
    return  filePath;
}
@end
