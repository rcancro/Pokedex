//
//  PIPokeData.m
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import <Foundation/Foundation.h>

NSArray<NSDictionary *> * pokeData(void) {
    static NSArray<NSDictionary *> *pokemonData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pokemonData = @[
            @{
                @"id" : @25,
                @"name" : @"pikachu",
                @"types": @[
                        @{
                            @"slot": @1,
                            @"type": @{
                                    @"name": @"electric",
                                    @"url": @"https://pokeapi.co/api/v2/type/13/"
                            }
                        }
                ],
                @"sprites" : @{
                        @"back_default" : @"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/25.png",
                        @"back_female" : @"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/female/25.png",
                        @"back_shiny" : @"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/25.png",
                        @"back_shiny_female" : @"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/female/25.png",
                        @"front_default" : @"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
                        @"front_female" : @"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/female/25.png",
                        @"front_shiny" : @"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/25.png",
                        @"front_shiny_female" : @"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/female/25.png",
                },
                @"description" : @"a mouse pokemon. and a detective. and a pop start. and a surfer.",
                @"weight" : @60,
                @"height" : @4,
                @"stats": @[
                        @{
                            @"base_stat": @35,
                            @"effort": @0,
                            @"stat": @{
                                    @"name": @"hp",
                                    @"url": @"https://pokeapi.co/api/v2/stat/1/"
                            }
                        },
                        @{
                            @"base_stat": @55,
                            @"effort": @0,
                            @"stat": @{
                                    @"name": @"attack",
                                    @"url": @"https://pokeapi.co/api/v2/stat/2/"
                            }
                        },
                        @{
                            @"base_stat": @40,
                            @"effort": @0,
                            @"stat": @{
                                    @"name": @"defense",
                                    @"url": @"https://pokeapi.co/api/v2/stat/3/"
                            }
                        },
                        @{
                            @"base_stat": @50,
                            @"effort": @0,
                            @"stat": @{
                                    @"name": @"special-attack",
                                    @"url": @"https://pokeapi.co/api/v2/stat/4/"
                            }
                        },
                        @{
                            @"base_stat": @50,
                            @"effort": @0,
                            @"stat": @{
                                    @"name": @"special-defense",
                                    @"url": @"https://pokeapi.co/api/v2/stat/5/"
                            }
                        },
                        @{
                            @"base_stat": @90,
                            @"effort": @2,
                            @"stat": @{
                                    @"name": @"speed",
                                    @"url": @"https://pokeapi.co/api/v2/stat/6/"
                            }
                        }
                ]
            },
        ];
    });
    return pokemonData;
}
