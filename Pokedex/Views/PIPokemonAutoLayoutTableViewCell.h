//
//  PIPokemonAutoLayoutTableViewCell.h
//  Pokedex
//
//  Created by Marcelo Queiroz on 8/25/21.
//

#import <UIKit/UIKit.h>

#import "PIPokemonAutoLayoutView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PIPokemonAutoLayoutTableViewCell : UITableViewCell

@property (nonatomic, strong) PIPokemonAutoLayoutView *pokemonView;

@end

NS_ASSUME_NONNULL_END
