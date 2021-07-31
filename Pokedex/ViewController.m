//
//  ViewController.m
//  Pokedex
//
//  Created by ricky cancro on 7/20/21.
//

#import "ViewController.h"

#import "PIPokemon.h"
#import "PIPokeData.h"
#import "PIPokemonXibTableViewCell.h"
#import "UIView+Nib.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary *pokemonData = [pokeData() firstObject];
    PIPokemon *pokemon = [[PIPokemon alloc] initWithDictionary:pokemonData];
    
    PIPokemonXibTableViewCell *cell = [PIPokemonXibTableViewCell loadFromNib];
    cell.frame = CGRectMake(0, 60, self.view.frame.size.width, cell.frame.size.height);
    
    [cell updateWithPokemon:pokemon];
    [self.view addSubview:cell];
}

@end
