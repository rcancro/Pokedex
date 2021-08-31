//
//  PIPokemonDataManager.h
//  Pokedex
//
//  Created by Ray Cho on 8/30/21.
//

#import <Foundation/Foundation.h>

@class PIPokemon;

NS_ASSUME_NONNULL_BEGIN

typedef void (^PokemonFetchCompletion)(PIPokemon *);

// This class will serve as a single access point for managing pokedex data
// that needs to be shared across different surfaces.
@interface PIPokemonDataManager : NSObject

@property (class, strong, readonly) PIPokemonDataManager *sharedManager;

- (NSArray<PIPokemon *> *)fetchPokedex;
- (void)fetchPokemonWithId:(NSInteger)pokemonId completion:(PokemonFetchCompletion)completion;
- (void)pinPokemon:(PIPokemon *)pokemon;

@end

NS_ASSUME_NONNULL_END
