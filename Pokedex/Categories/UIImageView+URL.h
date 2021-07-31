//
//  UIImageView+URL.h
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (URL)

- (void)setURL:(NSURL *)url;
- (void)setURL:(NSURL *)url placeholderColor:(UIColor *)placeholderColor;

@end

NS_ASSUME_NONNULL_END
