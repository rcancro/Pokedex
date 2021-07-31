//
//  PIPokemon+Additions.m
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import "PIPokemon+Additions.h"

@implementation PIPokemon (Additions)

- (NSString *)pokemonNumberAsFormattedString
{
    // NOTE: NSNumberFormatter and (moreso) NSDateFormatters are expensive to allocate
    // If something will use the same number formatter often, cache it instead of creating
    // a new one each time.
    // If you are curious: https://sarunw.com/posts/how-expensive-is-dateformatter/
    static NSNumberFormatter *pokemonNumberFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pokemonNumberFormatter = [[NSNumberFormatter alloc] init];
        [pokemonNumberFormatter setPaddingPosition:NSNumberFormatterPadBeforePrefix];
        [pokemonNumberFormatter setPaddingCharacter:@"0"];
        [pokemonNumberFormatter setMinimumIntegerDigits:3];
    });
    return [pokemonNumberFormatter stringFromNumber:@(self.number)];
}

@end
