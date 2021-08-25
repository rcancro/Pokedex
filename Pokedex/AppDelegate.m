//
//  AppDelegate.m
//  Pokedex
//
//  Created by ricky cancro on 7/20/21.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "PIPokedexTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = [[PIPokedexTableViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
