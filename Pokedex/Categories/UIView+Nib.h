//
//  UIView+Nib.h
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Nib)

/// convenience method to load a view from a xib file
+ (instancetype)loadFromNib;

@end

NS_ASSUME_NONNULL_END
