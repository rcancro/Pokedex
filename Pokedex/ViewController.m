//
//  ViewController.m
//  Pokedex
//
//  Created by ricky cancro on 7/20/21.
//

#import "ViewController.h"

#import "PIPokemon.h"
#import "PIPokeData.h"
#import "PIPokemonAutoLayoutView.h"
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

    PIPokemonAutoLayoutView *autoLayoutCell = [[PIPokemonAutoLayoutView alloc] init];
    CGSize size = [autoLayoutCell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    autoLayoutCell.frame = CGRectMake(0, 180, self.view.frame.size.width, size.height);
    [autoLayoutCell updateWithPokemon:pokemon];
    
    [self.view addSubview:cell];
    [self.view addSubview:autoLayoutCell];
}

@end
