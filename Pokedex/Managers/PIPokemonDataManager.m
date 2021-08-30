//
//  PIPokemonDataManager.m
//  Pokedex
//
//  Created by Ray Cho on 8/30/21.
//

#import "PIPokemonDataManager.h"
#import "PIPokeData.h"
#import "PIPokemon.h"

@interface PIPokemonDataManager()

@property (nonatomic, copy, readwrite) NSArray<PIPokemon *> *pokedex;

@end

@implementation PIPokemonDataManager

+ (instancetype)sharedManager
{
    // Creates a single global, shared instance of the class `PIPokemonDataManager`.
    // Provides a unified access point to Pokemon data across surfaces.
    static PIPokemonDataManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[PIPokemonDataManager alloc] init];
    });
    return sharedManager;
}

- (NSArray<PIPokemon *> *)fetchPokedex
{
    // Fetch pokedex if empty, otherwise return the cached pokedex.
    if (self.pokedex.count == 0) {
        self.pokedex = pokedex();
    }
    return self.pokedex;
}

- (void)pinPokemon:(PIPokemon *)pokemon
{
    // Mark a pokemon as "pinned".
    for (PIPokemon *pokemonInPokedex in self.pokedex) {
        if ([pokemonInPokedex.name isEqualToString:pokemon.name]) {
            pokemonInPokedex.isPinned = YES;
            return;
        }
    }
}

@end
