//
//  PIPokemonXibTableViewCell.m
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import "PIPokemonXibTableViewCell.h"
#import "PIPokemon+Additions.h"
#import "PIPokemonType+TypeIcon.h"
#import "UIImageView+URL.h"

@implementation PIPokemonXibTableViewCell

// This method is called on any object when it is loaded from a xib. It is only called once.
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.numberLabel.textColor = UIColor.lightTextColor;
    self.pokemonNameLabel.textColor = UIColor.darkTextColor;
    self.firstTypeLabel.textColor = UIColor.darkTextColor;
    self.secondTypeLabel.textColor = UIColor.darkTextColor;
}

- (void)updateWithPokemon:(PIPokemon *)pokemon
{
    self.numberLabel.text = [pokemon pokemonNumberAsFormattedString];
    
    // I'm using the common knowledge that Pokemon can only have 2 types
    PIPokemonType *type1 = [pokemon.types firstObject];
    PIPokemonType *type2 = pokemon.types.count > 1 ? [pokemon.types lastObject] : nil;
    
    self.firstTypeImageView.image = [type1 imageForType];
    self.firstTypeLabel.text = [type1.name capitalizedString];
    self.firstTypeLabel.textColor = [type1 colorForType];
    
    // not all pokemon have two types. This could be nil
    if (type2) {
        self.secondTypeImageView.image = [type2 imageForType];
        self.secondTypeLabel.text = [type2.name capitalizedString];
        self.secondTypeLabel.textColor = [type2 colorForType];
    } else {
        self.secondTypeImageView.image = nil;
        self.secondTypeLabel.text = nil;
    }
    
    self.pokemonNameLabel.text = [pokemon.name capitalizedString];
    [self.pokemonImageView setURL:pokemon.imageURL];
}


@end
