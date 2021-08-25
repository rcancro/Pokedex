//
//  PIPokemonAutoLayoutTableViewCell.m
//  Pokedex
//
//  Created by Marcelo Queiroz on 8/25/21.
//

#import "PIPokemonAutoLayoutTableViewCell.h"

@implementation PIPokemonAutoLayoutTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _pokemonView = [[PIPokemonAutoLayoutView alloc] init];
        _pokemonView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_pokemonView];
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    [NSLayoutConstraint activateConstraints:@[
        // set the content view to have same width and height to the pokemonView
        [self.contentView.widthAnchor constraintEqualToAnchor:self.pokemonView.widthAnchor],
        [self.contentView.heightAnchor constraintEqualToAnchor:self.pokemonView.heightAnchor]
    ]];
}

@end
