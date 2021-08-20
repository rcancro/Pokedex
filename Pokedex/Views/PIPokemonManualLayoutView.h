//
//  PIPokemonManualLayoutTableViewCell.h
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import <UIKit/UIKit.h>

@class PIPokemon;

NS_ASSUME_NONNULL_BEGIN

@interface PIPokemonManualLayoutView : UIView

- (void)updateWithPokemon:(PIPokemon *)pokemon;

@end

NS_ASSUME_NONNULL_END
