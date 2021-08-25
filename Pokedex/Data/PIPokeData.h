//
//  PIPokeData.h
//  Pokedex
//
//  Created by ricky cancro on 7/26/21.
//

#import <Foundation/Foundation.h>

@class PIPokemon;

extern NSDictionary *exampleTypeData(void);
extern NSDictionary *exampleStatData(void);

extern NSArray<NSDictionary *> * pokeData(void);
extern NSArray<PIPokemon *> * pokedex(void);
