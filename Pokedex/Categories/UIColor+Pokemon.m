//
//  UIColor+Pokemon.m
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import "UIColor+Pokemon.h"

@implementation UIColor (Pokemon)

+ (UIColor *)pokeballColor
{
    static UIColor *gPokeballColor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gPokeballColor = [[UIColor alloc] initWithRed:238.0/255.0 green:21.0/255.0 blue:21.0/255.0 alpha:1.0];
    });
    return gPokeballColor;
}

@end
