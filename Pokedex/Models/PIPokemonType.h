//
//  PIPokemonType.h
//  Pokedex
//
//  Created by ricky cancro on 7/20/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PIPokemonType : NSObject

@property (nonatomic, copy, readonly) NSString *name;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
