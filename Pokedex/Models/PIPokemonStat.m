//
//  PIStat.m
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import "PIPokemonStat.h"

@implementation PIPokemonStat

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _name = dictionary[@"stat"][@"name"];
        _value = [dictionary[@"base_stat"] unsignedIntValue];
    }
    return self;
}

- (NSString *)description{
    NSString *descrip = [NSString stringWithFormat:@"%@ : %tu", self.name, self.value];
    return descrip;
}

@end
