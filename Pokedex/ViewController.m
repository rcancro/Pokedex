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
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    [self setNavigationBarTitle];
    self.view.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"***** viewWillAppear is called");
    [self showViewAfterTwoSeconds];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self animateLastViewToANewPlace];
    NSLog(@"** view did appear is called");
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
        self.manualView.frame = CGRectMake(20, 320, self.view.frame.size.width, self.view.frame.size.height);
    } completion:nil];
}

- (void)viewWillLayoutSubviews
{
    NSLog(@"******** bounds is %@", NSStringFromCGRect(self.view.bounds));
    NSLog(@"******** frame is %@", NSStringFromCGRect(self.view.frame));

    self.view.frame = self.view.bounds;
    NSLog(@"******* viewWillLayoutSubviews is called");

}

- (void)viewDidLayoutSubviews
{
    NSLog(@"******* viewDidLayoutSubviews is called");
}
@end
