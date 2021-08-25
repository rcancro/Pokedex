//
//  PIPokedexTableViewController.m
//  Pokedex
//
//  Created by Marcelo Queiroz on 8/12/21.
//

#import "PIPokedexTableViewController.h"

#import "PIPokeData.h"
#import "PIPokemon.h"

@implementation PIPokedexTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pokedex = pokedex();
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"kCellId"];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kCellId" forIndexPath:indexPath];
    cell.textLabel.text = pokemon.name;
    return cell;
}

@end
