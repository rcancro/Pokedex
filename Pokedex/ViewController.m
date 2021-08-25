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
#import "PIPokemonManualLayoutView.h"
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
    [autoLayoutCell updateWithPokemon:pokemon];
    CGSize size = [autoLayoutCell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    autoLayoutCell.frame = CGRectMake(0, 180, self.view.frame.size.width, size.height);
    
    PIPokemonManualLayoutView *manualView = [[PIPokemonManualLayoutView alloc] init];
    [manualView updateWithPokemon:pokemon];
    CGSize manualSize = [manualView sizeThatFits:CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX)];
    manualView.frame = CGRectMake(0, 300, self.view.frame.size.width, manualSize.height);
    
    [self.view addSubview:cell];
    [self.view addSubview:autoLayoutCell];
    [self.view addSubview:manualView];
    
    self.view.backgroundColor = UIColor.systemBackgroundColor;
}

@end
