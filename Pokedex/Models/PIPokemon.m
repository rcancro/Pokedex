//
//  PIPokemon.m
//  Pokedex
//
//  Created by ricky cancro on 7/20/21.
//

#import "PIPokemon.h"

// here we have to import the files since we are using methods in these classes
// the compiler wants to know for sure that the methods we are calling exist
#import "PIPokemonType.h"
#import "PIPokemonStat.h"

@implementation PIPokemon

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _number = [dictionary[@"id"] unsignedIntValue];
        _weight = [dictionary[@"weight"] unsignedIntValue];
        _height = [dictionary[@"height"] unsignedIntValue];
        
        _name = dictionary[@"name"];
        _imageURL = [NSURL URLWithString:dictionary[@"sprites"][@"other"][@"official-artwork"][@"front_default"]];
        
        NSMutableArray *types = [NSMutableArray array];
        for (NSDictionary *typeDictionary in dictionary[@"types"]) {
            PIPokemonType *type = [[PIPokemonType alloc] initWithDictionary:typeDictionary];
            [types addObject:type];
        }
        _types = types;
        
        NSMutableArray *stats = [NSMutableArray array];
        for (NSDictionary *statDictionary in dictionary[@"stats"]) {
            PIPokemonStat *stat = [[PIPokemonStat alloc] initWithDictionary:statDictionary];
            [stats addObject:stat];
        }
        _stats = stats;
    }
    return self;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"\nName: %@ Number: %tu\n", self.name, self.number];
    [description appendFormat:@"Weight: %tu Height: %tu\n", self.weight, self.height];
    [description appendString:@"Types:\n"];
    for (PIPokemonType *type in self.types) {
        [description appendFormat:@"\t%@\n", type];
    }
    [description appendString:@"Stats:\n"];
    for (PIPokemonStat *stat in self.stats) {
        [description appendFormat:@"\t%@\n", stat];
    }
    return description;
}

@end
