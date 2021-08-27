//
//  PIPokedexTableViewController.h
//  Pokedex
//
//  Created by Marcelo Queiroz on 8/12/21.
//

#import <UIKit/UIKit.h>

@class PIPokemon;
@class AVAudioPlayer;

NS_ASSUME_NONNULL_BEGIN

@interface PIPokedexTableViewController : UITableViewController

@property (nonatomic, strong) NSArray<PIPokemon *> *pokedex;
@property (nonatomic, strong) AVAudioPlayer *pokemonNoisePlayer;

@end

NS_ASSUME_NONNULL_END
