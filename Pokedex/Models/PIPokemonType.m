//
//  PIPokemonType.m
//  Pokedex
//
//  Created by ricky cancro on 7/20/21.
//

#import "PIPokemonType.h"

@implementation PIPokemonType

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _name = dictionary[@"type"][@"name"];
    }
    return self;
}

- (NSString *)description
{
    return self.name;
}

@end
