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

@protocol PIPokemonViewControllerDelegate

// Here we define delegate methods to be implemented by another object.
// Naming convention for delegate methods is to have the name of the object requesting delegation
// (e.g. `PIPokemonViewController` in this case) as a prefix and use arguments to describe what event
// occurred inside the object (e.g. `-pokemonViewController:didPinPokemon:` would mean we pinned a pokemon
// inside the pokemon VC).
- (void)pokemonViewController:(PIPokemonViewController *)viewController didPinPokemon:(PIPokemon *)pokemon;
- (void)pokemonViewControllerDidRequestToDismiss:(PIPokemonViewController *)viewController;

@end

@interface PIPokemonViewController : UIViewController

// Delegate property we can assign other external objects. Weak reference is used to avoid strong reference cycle.
@property (nonatomic, weak, readwrite) id<PIPokemonViewControllerDelegate> delegate;

- (instancetype)initWithPokemon:(PIPokemon *)pokemon;

@end

NS_ASSUME_NONNULL_END
