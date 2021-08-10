//
//  PIPokemonManualLayoutTableViewCell.m
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import "PIPokemonManualLayoutView.h"
#import "PIPokemon+Additions.h"
#import "PIPokemonType+TypeIcon.h"
#import "UIImageView+URL.h"

static const CGSize kPokemonImageSize = { .width = 56.0, .height = 56.0 };
static const CGSize kPokemonTypeImageSize = { .width = 14.0, .height = 14.0 };

// Obj-c has no perception of private or protected. Everything is a message, so you can
// access anything. However, a typical pattern is to use anonymous categories to "hide"
// properties from the header file. Since you can send any message dynamically to any
// object, you can technically still access these properties. But this is the best
// we can get with Obj-C.
@interface PIPokemonManualLayoutView()

@property (nonatomic) UIImageView *pokemonImageView;
@property (nonatomic) UILabel *pokemonNameLabel;
@property (nonatomic) UIImageView *firstTypeImageView;
@property (nonatomic) UILabel *firstTypeLabel;
@property (nonatomic) UIImageView *secondTypeImageView;
@property (nonatomic) UILabel *secondTypeLabel;
@property (nonatomic) UILabel *numberLabel;

@end

@implementation PIPokemonManualLayoutView

- (instancetype)init
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        
        _pokemonImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_pokemonImageView];
        
        _pokemonNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _pokemonNameLabel.textColor = [UIColor darkTextColor];
        _pokemonNameLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightSemibold];
        [self addSubview:_pokemonNameLabel];

        _firstTypeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _firstTypeLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_firstTypeLabel];

        _firstTypeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_firstTypeImageView];

        _secondTypeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _secondTypeLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_secondTypeLabel];

        _secondTypeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_secondTypeImageView];

        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = [UIColor lightTextColor];
        _numberLabel.font = [UIFont systemFontOfSize:36.0 weight:UIFontWeightBold];
        [self addSubview:_numberLabel];
    }
    return self;
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

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self calculateHeightForWidth:self.frame.size.width applyLayout:YES];
}

- (CGSize)sizeThatFits:(CGSize)size
{
    return CGSizeMake(size.width, [self calculateHeightForWidth:size.width applyLayout:NO]);
}

- (CGFloat)calculateHeightForWidth:(CGFloat)width applyLayout:(BOOL)apply
{
    CGFloat xMargins = 16.0;
    CGFloat yMargins = 16.0;
    CGFloat nameTypeSpacing = 4.0;
    
    CGFloat typeImageLabelPadding = 4.0;
    CGFloat typesPadding = 8.0;

    // use the label's sizeThatFits: method to compute the label size.
    // We can't use a static height because we don't know if the text will wrap and we don't
    // know what font multipliers a user may be using for accessibility.
    CGSize numberLabelSize = [self.numberLabel sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)];
    
    // here we determine how much room we want the name label to take up. This label will get the most room to stretch
    CGFloat nameLabelWidth = width - (xMargins + kPokemonImageSize.width + xMargins + xMargins + numberLabelSize.width + xMargins);
    // we then use that size with float max height to determine our size.
    CGSize pokemonNameLabelSize = [self.pokemonNameLabel sizeThatFits:CGSizeMake(nameLabelWidth, CGFLOAT_MAX)];
    
    CGSize typeOneSize = [self.firstTypeLabel sizeThatFits:CGSizeMake(nameLabelWidth, CGFLOAT_MAX)];
    
    CGFloat textHeight = yMargins + pokemonNameLabelSize.height + nameTypeSpacing + typeOneSize.height + yMargins;
    CGFloat imageHeight = yMargins + kPokemonImageSize.height + yMargins;
    
    CGFloat totalHeight = MAX(textHeight, imageHeight);
    
    if (apply) {
        // when creating frame, we also need to determine the x,y origin coordinates for each view.
        
        // because we don't know how big a font multiplier a user may have turned on, we need to figure out which part
        // of the cell actually determine the final height. Is it the image + the yMargins, or is it the pokemonName +
        // types + yMargins that are bigger? Whichever is smaller gets offset by 1/2 of the larger height so everything
        // is centered.
        CGFloat extraImageYPadding = 0;
        CGFloat extraTextYPadding = 0;
        if (textHeight > imageHeight) {
            extraTextYPadding = (textHeight - imageHeight)/2.0;
        } else {
            extraTextYPadding = (imageHeight - textHeight)/2.0;
        }
        
        CGRect pokemonImageFrame = CGRectMake(xMargins, yMargins + extraImageYPadding, kPokemonImageSize.width, kPokemonImageSize.height);
        CGRect pokemonNameLabelFrame = CGRectMake(CGRectGetMaxX(pokemonImageFrame) + xMargins, yMargins + extraTextYPadding, nameLabelWidth, pokemonNameLabelSize.height);
        
        
        CGFloat typeImageYPadding = 0;
        CGFloat typeTextYPadding = 0;
        if (typeOneSize.height > kPokemonTypeImageSize.height) {
            typeImageYPadding = (typeOneSize.height - kPokemonTypeImageSize.height)/2.0;
        } else {
            typeTextYPadding = (kPokemonTypeImageSize.height - typeOneSize.height)/2.0;
        }
        
        // finally we can compute frames
        // note the use of CGRectGetMaxX/Y. It is useful for laying out!
        CGRect typeOneImageFrame = CGRectMake(CGRectGetMinX(pokemonNameLabelFrame),
                                             CGRectGetMaxY(pokemonNameLabelFrame) + typeImageYPadding,
                                             kPokemonTypeImageSize.width,
                                             kPokemonTypeImageSize.height);
        CGRect typeOneTextFrame = CGRectMake(CGRectGetMaxX(typeOneImageFrame) + typeImageLabelPadding,
                                             CGRectGetMaxY(pokemonNameLabelFrame) + typeTextYPadding,
                                             typeOneSize.width,
                                             typeOneSize.height);
        
        CGRect typeTwoImageFrame = CGRectMake(CGRectGetMaxX(typeOneTextFrame) + typesPadding,
                                              typeOneImageFrame.origin.y,
                                              kPokemonTypeImageSize.width,
                                              kPokemonTypeImageSize.height);
        
        CGSize typeTwoSize = [self.secondTypeLabel sizeThatFits:CGSizeMake(nameLabelWidth, CGFLOAT_MAX)];
        CGRect typeTwoTextFrame = CGRectMake(CGRectGetMaxX(typeTwoImageFrame) + typeImageLabelPadding,
                                             typeOneTextFrame.origin.y,
                                             typeTwoSize.width,
                                             typeTwoSize.height);
        
        CGRect numberLabelFrame = CGRectMake(CGRectGetMaxX(pokemonNameLabelFrame) + xMargins,
                                        (totalHeight - numberLabelSize.height)/2.0,
                                        numberLabelSize.width,
                                        numberLabelSize.height);

        // finally we set the frames!
        self.pokemonImageView.frame = pokemonImageFrame;
        self.pokemonNameLabel.frame = pokemonNameLabelFrame;
        self.firstTypeImageView.frame = typeOneImageFrame;
        self.firstTypeLabel.frame = typeOneTextFrame;
        self.secondTypeImageView.frame = typeTwoImageFrame;
        self.secondTypeLabel.frame = typeTwoTextFrame;
        self.numberLabel.frame = numberLabelFrame;
    }
    
    return totalHeight;

}

@end
