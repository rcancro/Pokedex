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
#import "PIPokemonViewController.h"
#import "PIPokemonDataManager.h"
@interface PIPokedexTableViewController() <PIPokemonViewControllerDelegate>

@end

@implementation PIPokedexTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pokedex = [PIPokemonDataManager.sharedManager fetchPokedex];
        [self.tableView registerClass:[PIPokemonAutoLayoutTableViewCell class] forCellReuseIdentifier:@"PokemonCell"];
        
        // Long Press Gesture - to play the pokemon cry!
        UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        [self.tableView addGestureRecognizer:longPressRecognizer];
        
        
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get the pokemon from our pokedex
    PIPokemon *pokemon = self.pokedex[indexPath.row];
    
    
    // HW3B: Although Team Rocket had the audacity to destory our local pokemon data, we can still fetch them via https://pokeapi.co/. Implement fetchPokemonWithId in PIPokemonDataManager
    [[PIPokemonDataManager sharedManager] fetchPokemonWithId:pokemon.number completion:^(PIPokemon * _Nonnull pokemon) {
    
        PIPokemonViewController *pokemonViewController = [[PIPokemonViewController alloc] initWithPokemon:pokemon];
        pokemonViewController.delegate = self;
        [self presentViewController:pokemonViewController animated:YES completion:nil];
    }];
}

#pragma mark - Gesture Recognizers

- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    CGPoint point = [gestureRecognizer locationInView:self.tableView];
    
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:point];
    if (indexPath != nil && indexPath.row && gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        PIPokemon *pokemon = self.pokedex[indexPath.row];
        self.pokemonNoisePlayer = [self createAudioPlayerForPokemon:pokemon];
        [self.pokemonNoisePlayer play];
    }
}

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

- (void)pokemonViewController:(PIPokemonViewController *)viewController didPinPokemon:(PIPokemon *)pokemon
{
    [self dismissViewControllerAnimated:YES completion:^{
        // Fetch the latest pokemon data and reload the tableview.
        self.pokedex = [PIPokemonDataManager.sharedManager fetchPokedex];
        [self.tableView reloadData];
    }];
}

- (void)pokemonViewControllerDidRequestToDismiss:(nonnull PIPokemonViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
