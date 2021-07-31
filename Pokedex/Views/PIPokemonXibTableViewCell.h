//
//  PIPokemonXibTableViewCell.h
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import <UIKit/UIKit.h>

@class PIPokemon;

NS_ASSUME_NONNULL_BEGIN

@interface PIPokemonXibTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *pokemonImageView;
@property (weak, nonatomic) IBOutlet UILabel *pokemonNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *firstTypeImageView;
@property (weak, nonatomic) IBOutlet UILabel *firstTypeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *secondTypeImageView;
@property (weak, nonatomic) IBOutlet UILabel *secondTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

- (void)updateWithPokemon:(PIPokemon *)pokemon;

@end

NS_ASSUME_NONNULL_END
