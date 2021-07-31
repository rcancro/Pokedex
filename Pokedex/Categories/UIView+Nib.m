//
//  UIView+Nib.m
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import "UIView+Nib.h"

@implementation UIView (Nib)

+ (instancetype)loadFromNib
{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil];
    return [views firstObject];

}

@end
