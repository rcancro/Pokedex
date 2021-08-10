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

static const CGSize kPokemonImageSize = { .width = 56.0, .height = 56.0 };
static const CGSize kPokemonTypeImageSize = { .width = 14.0, .height = 14.0 };

// Obj-c has no perception of private or protected. Everything is a message, so you can
// access anything. However, a typical pattern is to use anonymous categories to "hide"
// properties from the header file. Since you can send any message dynamically to any
// object, you can technically still access these properties. But this is the best
// we can get with Obj-C (we also have compiler warnings that will stop you from doing it).
@interface PIPokemonAutoLayoutView()

@property (nonatomic, readonly) UIImageView *pokemonImageView;
@property (nonatomic, readonly) UILabel *pokemonNameLabel;
@property (nonatomic, readonly) UIImageView *firstTypeImageView;
@property (nonatomic, readonly) UILabel *firstTypeLabel;
@property (nonatomic, readonly) UIImageView *secondTypeImageView;
@property (nonatomic, readonly) UILabel *secondTypeLabel;
@property (nonatomic, readonly) UILabel *numberLabel;

@property (nonatomic, readonly) UIStackView *typesHorizontalStackView;
@property (nonatomic, readonly) UIStackView *textVerticalStackView;
@property (nonatomic, readonly) UIStackView *cellHorizontalStackView;

@end

@implementation PIPokemonAutoLayoutView

- (instancetype)init
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _pokemonImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        // translatesAutoresizingMaskIntoConstraints is a confusing artifact of the transition from manual layout to autolayout.
        // autoresizingMask is a bitmask on UIView that tell a view how to resize if the view size changes. You can see the
        // possible values in UIViewAutoresizing. Autolayout will try to take this mask and convert it to constraints which
        // you almost NEVER want. So it is very common to see view.translatesAutoresizingMaskIntoConstraints = NO when
        // using autolayout. Fun!
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

        // Here we are using UIStackViews to layout the pokemon types. Each view should take up its
        // intrinsicContentSize and then use the giving spacing before layout out the next view.
        _typesHorizontalStackView = [[UIStackView alloc] initWithArrangedSubviews:@[_firstTypeImageView, _firstTypeLabel, _secondTypeImageView, _secondTypeImageView]];
        _typesHorizontalStackView.axis = UILayoutConstraintAxisHorizontal;
        _typesHorizontalStackView.spacing = 4;
        // here we are setting a custom spacing after the first type
        [_typesHorizontalStackView setCustomSpacing:8 afterView:_firstTypeLabel];
        _typesHorizontalStackView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_typesHorizontalStackView];
        
        // now we put the pokemon name and the type stacks in a vertical stack
        _textVerticalStackView = [[UIStackView alloc] initWithArrangedSubviews:@[_pokemonNameLabel, _typesHorizontalStackView]];
        _textVerticalStackView.axis = UILayoutConstraintAxisVertical;
        _textVerticalStackView.spacing = 4;
        _textVerticalStackView.translatesAutoresizingMaskIntoConstraints = NO;
        
        /*
         Oh boy. ContentHuggingPriority is how much a view wants to hug its subviews. Seriously, you can't make this up.
         We want our cell to look roughly like this:
         
         | [image] [pokemon name                  ]  [pokemon number] |
         
         Imagine the [] are the view hugging its subviews. We want image and number to get big bear hugs, while pokemon name
         is in its teenage years and perfer we keep our distance. This allows pokemon name to stretch to fill up the rest
         of the cell space. Without setting these priorities our cell would look like:
         
         | [image] [pokemon name]  [pokemon number]                   |

         */
        
        [_pokemonImageView setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        [_numberLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        [_textVerticalStackView setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        
        [self addSubview:_textVerticalStackView];
        
        // finally make our horizontal stack for the entire cell
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
    // but we aren't done! We still need to tell the cellHorizontalStackView how lay itself out
    [NSLayoutConstraint activateConstraints:@[
        // set the stack view with insets of 16 on all sides
        [self.cellHorizontalStackView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:16],
        [self.cellHorizontalStackView.topAnchor constraintEqualToAnchor:self.topAnchor constant:16],
        [self.cellHorizontalStackView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-16],
        [self.cellHorizontalStackView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-16],

        // tell the image how big to be
        [self.pokemonImageView.widthAnchor constraintEqualToConstant:kPokemonImageSize.width],
        [self.pokemonImageView.heightAnchor constraintEqualToConstant:kPokemonImageSize.height],
        
        // tell the type images how big to be
        [self.firstTypeImageView.widthAnchor constraintEqualToConstant:kPokemonTypeImageSize.width],
        [self.firstTypeImageView.heightAnchor constraintEqualToConstant:kPokemonTypeImageSize.height],
        [self.secondTypeImageView.widthAnchor constraintEqualToConstant:kPokemonTypeImageSize.width],
        [self.secondTypeImageView.heightAnchor constraintEqualToConstant:kPokemonTypeImageSize.height],
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
