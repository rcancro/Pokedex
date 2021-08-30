//
//  PIPokemonViewController.m
//  Pokedex
//
//  Created by Ray Cho on 8/27/21.
//

#import "PIPokemonViewController.h"
#import "PIPokemonStat.h"
#import "PIPokemon.h"
#import "PIPokemon+Additions.h"
#import "PIPokemonType+TypeIcon.h"
#import "PIPokemonDataManager.h"
#import "UIImageView+URL.h"

static CGFloat kButtonHeight = 50.0;

@interface PIPokemonViewController ()

@property (nonatomic, strong, readonly) PIPokemon *pokemon;

@property (nonatomic, strong, readwrite) UIImageView *pokemonImageView;
@property (nonatomic, strong, readwrite) UILabel *nameLabel;

@property (nonatomic, strong, readwrite) UIStackView *pokemonDescriptionStackView;

@property (nonatomic, strong, readwrite) UIStackView *typeInfoStackView;
@property (nonatomic, strong, readwrite) UILabel *typeTitleLabel;
@property (nonatomic, strong, readwrite) UIImageView *firstTypeImageView;
@property (nonatomic, strong, readwrite) UIImageView *secondTypeImageView;

@property (nonatomic, strong, readwrite) NSMutableArray<UIStackView *> *statStackViews;
@property (nonatomic, strong, readwrite) NSMutableArray<UILabel *> *statTitleLabels;
@property (nonatomic, strong, readwrite) NSMutableArray<UILabel *> *statValueLabels;

@property (nonatomic, strong, readwrite) UIStackView *buttonStackView;
@property (nonatomic, strong, readwrite) UIButton *closeButton;
@property (nonatomic, strong, readwrite) UIButton *pinItButton;

@end

@implementation PIPokemonViewController

- (instancetype)initWithPokemon:(PIPokemon *)pokemon
{
    self = [super init];
    if (self) {
        _pokemon = pokemon;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [self setupWithPokemon:self.pokemon];
    [self setupViewHierarchy];
    [self setupLayout];
}

- (void)setupWithPokemon:(PIPokemon *)pokemon;
{
    self.view.backgroundColor = UIColor.whiteColor;

    self.pokemonImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.pokemonImageView setURL:pokemon.imageURL];
    self.pokemonImageView.translatesAutoresizingMaskIntoConstraints = NO;

    self.pokemonDescriptionStackView = [[UIStackView alloc] initWithFrame:CGRectZero];
    self.pokemonDescriptionStackView.axis = UILayoutConstraintAxisVertical;
    self.pokemonDescriptionStackView.alignment = UIStackViewAlignmentFill;
    self.pokemonDescriptionStackView.distribution = UIStackViewDistributionEqualSpacing;
    self.pokemonDescriptionStackView.translatesAutoresizingMaskIntoConstraints = NO;

    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    NSString *pokemonNumberString = [pokemon pokemonNumberAsFormattedString];
    NSString *pokemonNameString = pokemon.name;
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", pokemonNumberString, pokemonNameString];
    self.nameLabel.textColor = [UIColor darkTextColor];
    self.nameLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightSemibold];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;

    self.typeInfoStackView = [[UIStackView alloc] initWithFrame:CGRectZero];
    self.typeInfoStackView.axis = UILayoutConstraintAxisHorizontal;
    self.typeInfoStackView.alignment = UIStackViewAlignmentCenter;
    self.typeInfoStackView.translatesAutoresizingMaskIntoConstraints = NO;

    self.typeTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.typeTitleLabel.text = @"TYPE(s):";
    self.typeTitleLabel.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightSemibold];
    self.typeTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;

    PIPokemonType *type1 = pokemon.types.firstObject;
    self.firstTypeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.firstTypeImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.firstTypeImageView.image = [type1 imageForType];
    self.firstTypeImageView.translatesAutoresizingMaskIntoConstraints = NO;

    PIPokemonType *type2 = pokemon.types.count > 1 ? [pokemon.types lastObject] : nil;
    self.secondTypeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.secondTypeImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.secondTypeImageView.image = [type2 imageForType];
    self.secondTypeImageView.hidden = type2 == nil;
    self.secondTypeImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.statStackViews = [NSMutableArray array];
    self.statTitleLabels = [NSMutableArray array];
    self.statValueLabels = [NSMutableArray array];

    for (PIPokemonStat *pokemonStat in self.pokemon.stats) {
        UIStackView *stackView = [[UIStackView alloc] initWithFrame:CGRectZero];
        stackView.axis = UILayoutConstraintAxisHorizontal;
        stackView.distribution = UIStackViewDistributionFillEqually;
        stackView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.statStackViews addObject:stackView];

        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightSemibold];
        titleLabel.text = pokemonStat.name;
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.statTitleLabels addObject:titleLabel];

        UILabel *valueLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        valueLabel.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightRegular];
        valueLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)pokemonStat.value];
        valueLabel.textAlignment = NSTextAlignmentRight;
        valueLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.statValueLabels addObject:valueLabel];
    }

    self.buttonStackView = [[UIStackView alloc] initWithFrame:CGRectZero];
    self.buttonStackView.axis = UILayoutConstraintAxisHorizontal;
    self.buttonStackView.distribution = UIStackViewDistributionFillEqually;
    self.buttonStackView.spacing = 24.0;
    self.buttonStackView.translatesAutoresizingMaskIntoConstraints = NO;

    self.pinItButton = [[UIButton alloc] initWithFrame:CGRectZero];
    self.pinItButton.layer.cornerRadius = kButtonHeight / 2;
    self.pinItButton.backgroundColor = UIColor.redColor;
    [self.pinItButton setTitle:@"Pin it" forState:UIControlStateNormal];
    [self.pinItButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self.pinItButton addTarget:self action:@selector(didTapPinItButton) forControlEvents:UIControlEventTouchUpInside];
    self.pinItButton.translatesAutoresizingMaskIntoConstraints = NO;

    self.closeButton = [[UIButton alloc] initWithFrame:CGRectZero];
    self.closeButton.layer.cornerRadius = kButtonHeight / 2;
    self.closeButton.backgroundColor = UIColor.lightGrayColor;
    [self.closeButton setTitle:@"Close" forState:UIControlStateNormal];
    [self.closeButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(didTapCloseButton) forControlEvents:UIControlEventTouchUpInside];
    self.closeButton.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)setupViewHierarchy
{
    [self.view addSubview:self.pokemonImageView];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.pokemonDescriptionStackView];
    [self.view addSubview:self.buttonStackView];

    [self.pokemonDescriptionStackView addArrangedSubview:self.self.typeInfoStackView];

    [self.typeInfoStackView addArrangedSubview:self.typeTitleLabel];
    [self.typeInfoStackView addArrangedSubview:self.firstTypeImageView];
    [self.typeInfoStackView addArrangedSubview:self.secondTypeImageView];

    for (NSUInteger i = 0; i < self.statStackViews.count; i++) {
        UIStackView *stackView = self.statStackViews[i];
        [stackView addArrangedSubview:self.statTitleLabels[i]];
        [stackView addArrangedSubview:self.statValueLabels[i]];
        [self.pokemonDescriptionStackView addArrangedSubview:stackView];
    }

    [self.buttonStackView addArrangedSubview:self.pinItButton];
    [self.buttonStackView addArrangedSubview:self.closeButton];
}

- (void)setupLayout
{
    CGFloat imagePadding = 32.0;

    [NSLayoutConstraint activateConstraints:@[
        [self.pokemonImageView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:imagePadding],
        [self.pokemonImageView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:imagePadding],
        [self.pokemonImageView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-imagePadding],
        [self.pokemonImageView.widthAnchor constraintEqualToAnchor:self.pokemonImageView.heightAnchor],
    ]];

    CGFloat descriptionStackPadding = 64.0;

    [NSLayoutConstraint activateConstraints:@[
        [self.nameLabel.topAnchor constraintEqualToAnchor:self.pokemonImageView.bottomAnchor constant:imagePadding],
        [self.nameLabel.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:descriptionStackPadding],
        [self.nameLabel.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-descriptionStackPadding],
    ]];
    [self.nameLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];

    [NSLayoutConstraint activateConstraints:@[
        [self.pokemonDescriptionStackView.topAnchor constraintEqualToAnchor:self.nameLabel.bottomAnchor constant:16.0],
        [self.pokemonDescriptionStackView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:descriptionStackPadding],
        [self.pokemonDescriptionStackView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-descriptionStackPadding],
        [self.pokemonDescriptionStackView.bottomAnchor constraintLessThanOrEqualToAnchor:self.buttonStackView.topAnchor],
    ]];

    CGSize typeImageSize = CGSizeMake(24.0, 24.0);
    [NSLayoutConstraint activateConstraints:@[
        [self.firstTypeImageView.widthAnchor constraintEqualToConstant:typeImageSize.width],
        [self.firstTypeImageView.heightAnchor constraintEqualToConstant:typeImageSize.height],
    ]];
    [NSLayoutConstraint activateConstraints:@[
        [self.secondTypeImageView.widthAnchor constraintEqualToConstant:typeImageSize.width],
        [self.secondTypeImageView.heightAnchor constraintEqualToConstant:typeImageSize.height],
    ]];

    CGFloat labelStackHeight = 24.0;
    [NSLayoutConstraint activateConstraints:@[
        [self.typeInfoStackView.heightAnchor constraintEqualToConstant:labelStackHeight],
    ]];

    for (UIStackView *stackView in self.statStackViews) {
        [NSLayoutConstraint activateConstraints:@[
            [stackView.heightAnchor constraintEqualToConstant:labelStackHeight],
        ]];
    }

    [NSLayoutConstraint activateConstraints:@[
        [self.buttonStackView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:64.0],
        [self.buttonStackView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-64.0],
        [self.buttonStackView.bottomAnchor constraintLessThanOrEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
        [self.buttonStackView.heightAnchor constraintEqualToConstant:kButtonHeight],
    ]];
}

- (void)didTapPinItButton
{
    // Access the singleton manager class and update shared pokemon data.
    [PIPokemonDataManager.sharedManager pinPokemon:self.pokemon];

    // Tell the delegate that we pinned a pokemon from the view controller.
    [self.delegate pokemonViewController:self didPinPokemon:self.pokemon];
}

- (void)didTapCloseButton
{
    // Tell the delegate to dismiss the view controller.
    [self.delegate pokemonViewControllerDidRequestToDismiss:self];
}

@end
