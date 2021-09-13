//
//  PIPokemonViewController.h
//  Pokedex
//
//  Created by Ray Cho on 8/27/21.
//

#import <UIKit/UIKit.h>

@class PIPokemon;
@class PIPokemonViewController;

NS_ASSUME_NONNULL_BEGIN

@interface PIPokemonViewController : UIViewController

// TODO: (Delegate) Add delegate property

- (instancetype)initWithPokemon:(PIPokemon *)pokemon;

@end

NS_ASSUME_NONNULL_END
