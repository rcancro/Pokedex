//
//  UIColor+Pokemon.m
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import "UIColor+Pokemon.h"

#define OnceColor(make) \
({ \
    static dispatch_once_t onceToken; \
    static UIColor *color = nil;\
    dispatch_once(&onceToken, ^{\
        color = make;\
    });\
    color; \
})

@implementation UIColor (Pokemon)

+ (UIColor *)darkTextColor
{
    return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return UIColor.whiteColor;
        }
        return [[UIColor alloc] initWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    }];
}

+ (UIColor *)lightTextColor
{
    return UIColor.systemGray4Color;
}

+ (UIColor *)pokeballColor
{
    return OnceColor([[UIColor alloc] initWithRed:238.0/255.0 green:21.0/255.0 blue:21.0/255.0 alpha:1.0]);
}

+ (UIColor *)bugColor
{
    return OnceColor([UIColor colorWithRed:65.0/255.0 green:117.0/255.0 blue:5.0/255.0 alpha:1.0]);
}

+ (UIColor *)grassColor;
{
    return OnceColor([UIColor colorWithRed:126.0/255.0 green:211.0/255.0 blue:33.0/255.0 alpha:1.0]);
}

+ (UIColor *)waterColor;
{
    return OnceColor([UIColor colorWithRed:74.0/255.0 green:144.0/255.0 blue:226.0/255.0 alpha:1.0]);
}

+ (UIColor *)poisonColor;
{
    return OnceColor([UIColor colorWithRed:154.0/255.0 green:110.0/255.0 blue:192.0/255.0 alpha:1.0]);
}

+ (UIColor *)fireColor;
{
    return OnceColor([UIColor colorWithRed:202.0/255.0 green:70.0/255.0 blue:74.0/255.0 alpha:1.0]);
}

+ (UIColor *)normalColor;
{
    return OnceColor([UIColor colorWithRed:168.0/255.0 green:169.0/255.0 blue:117.0/255.0 alpha:1.0]);
}

+ (UIColor *)flyingColor;
{
    return OnceColor([UIColor colorWithRed:168.0/255.0 green:141.0/255.0 blue:243.0/255.0 alpha:1.0]);
}

+ (UIColor *)fightingColor
{
    return OnceColor([UIColor colorWithRed:168.0/255.0 green:141.0/255.0 blue:243.0/255.0 alpha:1.0]);
}

+ (UIColor *)groundColor;
{
    return OnceColor([UIColor colorWithRed:225.0/255.0 green:193.0/255.0 blue:97.0/255.0 alpha:1.0]);
}

+ (UIColor *)rockColor;
{
    return OnceColor([UIColor colorWithRed:185.0/255.0 green:161.0/255.0 blue:44.0/255.0 alpha:1.0]);
}

+ (UIColor *)ghostColor;
{
    return OnceColor([UIColor colorWithRed:112.0/255.0 green:86.0/255.0 blue:154.0/255.0 alpha:1.0]);
}

+ (UIColor *)steelColor;
{
    return OnceColor([UIColor colorWithRed:184.0/255.0 green:184.0/255.0 blue:209.0/255.0 alpha:1.0]);
}

+ (UIColor *)electricColor;
{
    return OnceColor([UIColor colorWithRed:249.0/255.0 green:209.0/255.0 blue:4.0/255.0 alpha:1.0]);
}

+ (UIColor *)psychicColor;
{
    return OnceColor([UIColor colorWithRed:251.0/255.0 green:85.0/255.0 blue:135.0/255.0 alpha:1.0]);
}

+ (UIColor *)iceColor;
{
    return OnceColor([UIColor colorWithRed:150.0/255.0 green:216.0/255.0 blue:217.0/255.0 alpha:1.0]);
}

+ (UIColor *)dragonColor;
{
    return OnceColor([UIColor colorWithRed:112.0/255.0 green:41.0/255.0 blue:252.0/255.0 alpha:1.0]);
}

+ (UIColor *)darkColor;
{
    return OnceColor([UIColor colorWithRed:113.0/255.0 green:88.0/255.0 blue:71.0/255.0 alpha:1.0]);
}

+ (UIColor *)fairyColor;
{
    return OnceColor([UIColor colorWithRed:240.0/255.0 green:152.0/255.0 blue:172.0/255.0 alpha:1.0]);
}

@end
