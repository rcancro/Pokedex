//
//  PIPokemonAutoLayoutView.m
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import "PIPokemonAutoLayoutView.h"
#import "PIPokemon+Additions.h"
#import "PIPokemonType+TypeIcon.h"
#import "UIImageView+URL.h"

@interface PIPokemonAutoLayoutView()
@property (nonatomic) UIImageView *pokemonImageView;
@property (nonatomic) UILabel *pokemonNameLabel;
@property (nonatomic) UIImageView *firstTypeImageView;
@property (nonatomic) UILabel *firstTypeLabel;
@property (nonatomic) UIImageView *secondTypeImageView;
@property (nonatomic) UILabel *secondTypeLabel;
@property (nonatomic) UILabel *numberLabel;

@property (nonatomic) UIStackView *typesHorizontalStackView;
@property (nonatomic) UIStackView *textVerticalStackView;
@property (nonatomic) UIStackView *cellHorizontalStackView;

@end

@implementation PIPokemonAutoLayoutView

- (instancetype)init
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _pokemonImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _pokemonImageView.translatesAutoresizingMaskIntoConstraints = NO;

        _pokemonNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _pokemonNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _pokemonNameLabel.textColor = [UIColor darkTextColor];
        _pokemonNameLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightSemibold];

        _firstTypeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _firstTypeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _firstTypeLabel.font = [UIFont systemFontOfSize:15];

        _firstTypeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _firstTypeImageView.translatesAutoresizingMaskIntoConstraints = NO;

        _secondTypeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _secondTypeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _secondTypeLabel.font = [UIFont systemFontOfSize:15];

        _secondTypeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _secondTypeImageView.translatesAutoresizingMaskIntoConstraints = NO;

        _numberLabel = [[UILabel alloc] init];
        _numberLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _numberLabel.textColor = [UIColor lightTextColor];
        _numberLabel.font = [UIFont systemFontOfSize:36.0 weight:UIFontWeightBold];

        _typesHorizontalStackView = [[UIStackView alloc] initWithArrangedSubviews:@[_firstTypeImageView, _firstTypeLabel, _secondTypeImageView, _secondTypeImageView]];
        _typesHorizontalStackView.axis = UILayoutConstraintAxisHorizontal;
        _typesHorizontalStackView.spacing = 4;
        [_typesHorizontalStackView setCustomSpacing:8 afterView:_firstTypeLabel];
        _typesHorizontalStackView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_typesHorizontalStackView];
        
        _textVerticalStackView = [[UIStackView alloc] initWithArrangedSubviews:@[_pokemonNameLabel, _typesHorizontalStackView]];
        _textVerticalStackView.axis = UILayoutConstraintAxisVertical;
        _textVerticalStackView.spacing = 4;
        _textVerticalStackView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [_pokemonImageView setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        [_numberLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        [_textVerticalStackView setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        
        [self addSubview:_textVerticalStackView];
        
        _cellHorizontalStackView = [[UIStackView alloc] initWithArrangedSubviews:@[_pokemonImageView, _textVerticalStackView, _numberLabel]];
        _cellHorizontalStackView.spacing = 16;
        _cellHorizontalStackView.translatesAutoresizingMaskIntoConstraints = NO;
        _cellHorizontalStackView.axis = UILayoutConstraintAxisHorizontal;
        [_cellHorizontalStackView setAlignment:UIStackViewAlignmentCenter];
        [self addSubview:_cellHorizontalStackView];
        
        [self setupConstraints];
        
    }
    return self;
}

- (void)setupConstraints
{
    [NSLayoutConstraint activateConstraints:@[
        [self.cellHorizontalStackView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:16],
        [self.cellHorizontalStackView.topAnchor constraintEqualToAnchor:self.topAnchor constant:16],
        [self.cellHorizontalStackView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-16],
        [self.cellHorizontalStackView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-16],

        [self.pokemonImageView.widthAnchor constraintEqualToConstant:56],
        [self.pokemonImageView.heightAnchor constraintEqualToConstant:56],
        
        [self.firstTypeImageView.widthAnchor constraintEqualToConstant:14],
        [self.firstTypeImageView.heightAnchor constraintEqualToConstant:14],
        [self.secondTypeImageView.widthAnchor constraintEqualToConstant:14],
        [self.secondTypeImageView.heightAnchor constraintEqualToConstant:14],
    ]];
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
