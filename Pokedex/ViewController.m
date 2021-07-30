//
//  ViewController.m
//  Pokedex
//
//  Created by ricky cancro on 7/20/21.
//

#import "ViewController.h"
#import "UIColor+Pokemon.h"
#import "PIPokemon.h"
#import "PIPokeData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor pokeballColor];
    NSDictionary *pokemonData = [pokeData() firstObject];
    PIPokemon *pokemon = [[PIPokemon alloc] initWithDictionary:pokemonData];
    NSLog(@"%@", pokemon);
}

@end
