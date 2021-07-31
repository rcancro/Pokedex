//
//  UIImageView+URL.m
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import "UIImageView+URL.h"

@implementation UIImageView (URL)

- (void)setURL:(NSURL *)url
{
    return [self setURL:url placeholderColor:UIColor.clearColor];
}

- (void)setURL:(NSURL *)url placeholderColor:(UIColor *)placeholderColor
{
    self.image = nil;
    self.backgroundColor = placeholderColor;
    
    NSURLSessionTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            self.backgroundColor = UIColor.clearColor;
            self.image = image;
        });
    }];
    [task resume];
}

@end
