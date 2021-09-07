//
//  ViewController.m
//  Pokedex
//
//  Created by ricky cancro on 7/20/21.
//

#import "ViewController.h"

#import "PIPokemon.h"
#import "PIPokeData.h"
#import "PIPokemonAutoLayoutView.h"
#import "PIPokemonManualLayoutView.h"
#import "PIPokemonXibTableViewCell.h"
#import "UIView+Nib.h"
@interface ViewController ()
@property(nonatomic, strong)PIPokemonManualLayoutView *manualView;
@property(nonatomic, strong)PIPokemonAutoLayoutView *autoLayoutCell;
@property(nonatomic, strong)UIButton *hideButton;
@property(nonatomic, assign)NSInteger pikachuCount;
@property(nonatomic, strong)UILabel *pikachuCountLabel;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // add print statement to see the order view lifecycle events being called
    NSLog(@"***** viewWillAppear is called");

    NSDictionary *pokemonData = [pokeData() firstObject];
    PIPokemon *pokemon = [[PIPokemon alloc] initWithDictionary:pokemonData];
    
    PIPokemonXibTableViewCell *cell = [PIPokemonXibTableViewCell loadFromNib];
    cell.frame = CGRectMake(self.view.frame.origin.x, 80, self.view.frame.size.width, cell.frame.size.height);
    [cell updateWithPokemon:pokemon];

    self.autoLayoutCell = [[PIPokemonAutoLayoutView alloc] init];
    [self.autoLayoutCell updateWithPokemon:pokemon];
    CGSize size = [self.autoLayoutCell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    self.autoLayoutCell.frame = CGRectMake(self.view.frame.origin.x, 200, self.view.frame.size.width, size.height);
    
    self.manualView = [[PIPokemonManualLayoutView alloc] init];
    [self.manualView updateWithPokemon:pokemon];
    CGSize manualSize = [self.manualView sizeThatFits:CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX)];
    self.manualView.frame = CGRectMake(self.view.frame.origin.x, 320, self.view.frame.size.width, manualSize.height);
    
    [self.view addSubview:cell];
    [self.view addSubview:self.autoLayoutCell];
    [self.view addSubview:self.manualView];
    
    // do initialization in viewdidload
    [self setNavigationBarTitle];
    self.pikachuCount = 3;
    [self createButton];
    [self createPikachuCountLabel];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // add print statement to see the order view lifecycle events being called
    NSLog(@"***** viewWillAppear is called");
    self.view.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // add print statement to see the order view lifecycle events being called
    NSLog(@"***** viewDidAppear is called");
    [self showViewAfterTwoSeconds];
    [self animateLastViewToANewPlace];
}


- (void)viewWillLayoutSubviews
{
    // add print statement to see the order view lifecycle events being called
    NSLog(@"***** viewWillLayoutSubviews is called");
}

- (void)viewDidLayoutSubviews
{
    // add print statement to see the order view lifecycle events being called
    NSLog(@"***** viewDidLayoutSubviews is called");
}

- (void)createPikachuCountLabel
{
    _pikachuCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _pikachuCountLabel.font = [UIFont systemFontOfSize:15];
    _pikachuCountLabel.frame = CGRectMake(25.0, 440.0, 160.0, 40.0);
    [self.view addSubview:_pikachuCountLabel];
    [self updatePikachuCountLabel];
}

- (void)updatePikachuCountLabel
{
    self.pikachuCountLabel.text = [NSString stringWithFormat:@"%ld Pikachus", self.pikachuCount];
}

- (void)createButton
{
    self.hideButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [self.hideButton addTarget:self
               action:@selector(buttonTapped)
     forControlEvents:UIControlEventTouchUpInside];
    [self.hideButton setTitle:@"hide last Pikachu" forState:UIControlStateNormal];
    [self.hideButton setBackgroundColor:UIColor.lightGrayColor];
    self.hideButton.frame = CGRectMake(8.0, 400.0, 160.0, 40.0);
    self.hideButton.layer.cornerRadius = 8.0;
    [self.view addSubview:self.hideButton];
}
- (void)buttonTapped
{
    self.manualView.hidden = !self.manualView.hidden;
    NSString *title = self.manualView.hidden ?  @"show last Pikachu" : @"hide last Pikachu";
    [self.hideButton setTitle:title forState:UIControlStateNormal];
    // in real application, model changes are from network
    self.pikachuCount = self.manualView.hidden ? 2 : 3;
    [self updatePikachuCountLabel];
}
- (void)showViewAfterTwoSeconds
{
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //code to be executed on the main queue after delay
        self.view.hidden = NO;
    });
}

- (void)setNavigationBarTitle
{
    self.title = @"pokedox main page";
}

- (void)animateLastViewToANewPlace
{
    [UIView animateWithDuration:2.0 delay:3.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.manualView.frame = CGRectMake(0, 320, self.view.frame.size.width, self.view.frame.size.height);
    } completion:nil];
}

@end
