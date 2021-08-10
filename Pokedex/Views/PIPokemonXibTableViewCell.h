//
//  PIPokemonXibTableViewCell.h
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import <UIKit/UIKit.h>

@class PIPokemon;

NS_ASSUME_NONNULL_BEGIN

/**
 A Pokemon cell backed with an Interface Builder (IB) xib (pronounced zib or nib or some reason)
 
 I have used Interface Builder professionally, but in general you don't see it that much.
 Some reasons are:
   * xibs are xml files, so merge conflicts are a mess
   * sometimes you have to look in two places to see why a component is configured a certain
     way -- is it set in the xib or in code?
   * if you have global colors (e.g., [UIColor pinterestRed], you can't access those from IB
 
 The main bonuses are easy layout (though with autolayout now, the constraint lines can get
 really confusing) and being able to discover what a view looks like (instead of needing to
 display it in the app, you can tap on the xib file).
 
 Click on PIPokemonXibTableViewCell.xib and take a look at it. IB has a bit of a learning
 curve on its own, but there should be several tutorials on the web. We don't use xibs at
 Pinterest, so we won't spend much time on this.
 
 Note: This class is a UITableViewCell subclass, while the other two pokemon views are
 UIView subclasses. This is because I couldn't get IB to work with a UIView and I gave
 up after a while.
*/
@interface PIPokemonXibTableViewCell : UITableViewCell

/**
When using Interface Builder, (I think) you must declare your properties in the .h file and
mark them as an "IBOutlet" so Interface Builder can see them. In IB you then make sure your
table cell is the type of your class and you can then connect components in the xib to the
components in the class.

 
 I dislike that these properties can't be marked readonly and have to be exposed.
 
 Possible test question: Does Ricky like Interface Builder?
 */
@property (weak, nonatomic) IBOutlet UIImageView *pokemonImageView;
@property (weak, nonatomic) IBOutlet UILabel *pokemonNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *firstTypeImageView;
@property (weak, nonatomic) IBOutlet UILabel *firstTypeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *secondTypeImageView;
@property (weak, nonatomic) IBOutlet UILabel *secondTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

/// A method to update the cell with a given pokemon
/// @param pokemon The pokemon to use to update the cell
- (void)updateWithPokemon:(PIPokemon *)pokemon;

@end

NS_ASSUME_NONNULL_END
