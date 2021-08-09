//
//  PIPokemonAutoLayoutView.h
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PIPokemon;

@interface PIPokemonAutoLayoutView : UIView

- (void)updateWithPokemon:(PIPokemon *)pokemon;

@end

NS_ASSUME_NONNULL_END
