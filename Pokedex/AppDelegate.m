//
//  AppDelegate.m
//  Pokedex
//
//  Created by ricky cancro on 7/20/21.
//

#import "AppDelegate.h"

#import "PIPokemon.h"
#import "PIPokemonStat.h"
#import "PIPokemonType.h"
#import "PIPokeData.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSDictionary *pokemonTypeData = exampleTypeData();
    PIPokemonType *pokemonType = [[PIPokemonType alloc] initWithDictionary:pokemonTypeData];
    NSLog(@"Pokemon type:\n%@", pokemonType);

    NSDictionary *pokemonStatData = exampleStatData();
    PIPokemonStat *pokemonStat = [[PIPokemonStat alloc] initWithDictionary:pokemonStatData];
    NSLog(@"Pokemon type:\n%@", pokemonStat);

    NSDictionary *pokemonData = [pokeData() firstObject];
    PIPokemon *pokemon = [[PIPokemon alloc] initWithDictionary:pokemonData];
    NSLog(@"Pokemon:\n%@", pokemon);

    
    return YES;
}


@end
