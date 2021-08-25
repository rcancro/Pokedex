//
//  PIPokedexTableViewController.m
//  Pokedex
//
//  Created by Marcelo Queiroz on 8/12/21.
//

#import "PIPokedexTableViewController.h"

#import "PIPokeData.h"
#import "PIPokemon.h"
#import "PIPokemonAutoLayoutTableViewCell.h"

@implementation PIPokedexTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pokedex = pokedex();
        [self.tableView registerClass:[PIPokemonAutoLayoutTableViewCell class] forCellReuseIdentifier:@"PokemonCell"];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pokedex.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PIPokemon *pokemon = self.pokedex[indexPath.row];
    PIPokemonAutoLayoutTableViewCell *pokemonCell = (PIPokemonAutoLayoutTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"PokemonCell"];
    [pokemonCell.pokemonView updateWithPokemon:pokemon];
    return pokemonCell;
}

@end
