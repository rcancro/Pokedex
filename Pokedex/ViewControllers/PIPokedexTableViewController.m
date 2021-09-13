//
//  PIPokedexTableViewController.m
//  Pokedex
//
//  Created by Marcelo Queiroz on 8/12/21.
//

#import <AVFAudio/AVAudioPlayer.h>

#import "PIPokedexTableViewController.h"

#import "PIPokeData.h"
#import "PIPokemon.h"
#import "PIPokemonAutoLayoutTableViewCell.h"

// TODO: (Delegate) Specify delegate(s) this view controller needs to conform

@interface PIPokedexTableViewController()

@end

@implementation PIPokedexTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        // TODO: (Singleton) Change below to get the pokedex data from the data manager class.
        _pokedex = pokedex();
        [self.tableView registerClass:[PIPokemonAutoLayoutTableViewCell class] forCellReuseIdentifier:@"PokemonCell"];
        
        // TODO: Long Press Gesture - to play the pokemon cry!
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

// TODO: use didSelectRowAtIndexPath here to handle taps on a row
    // TODO: (Presentation) Present `PIPokemonViewController` from here
    // TODO: (Delegate) Assign delegate of `PIPokemonViewController` to this VC

#pragma mark - Gesture Recognizers

// TODO: Add your method to handle the long press here

#pragma mark - Helper

- (AVAudioPlayer *)createAudioPlayerForPokemon:(PIPokemon *)pokemon
{
    NSString *pokemonName = pokemon.name;
    NSURL *cryURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                pathForResource:pokemonName ofType:@"mp3"]];
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:cryURL error:nil];
    [player prepareToPlay];
    return player;
}

#pragma mark - PIPokemonViewControllerDelegate

// TODO: (Delegate) Add delegate conformation methods for handling events from `PIPokemonViewController`.

@end
