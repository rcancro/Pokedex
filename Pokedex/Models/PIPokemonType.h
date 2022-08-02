//
//  PIPokemonType.h
//  Pokedex
//
//  Created by ricky cancro on 7/20/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PIPokemonType : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@property (nonatomic, copy, readonly) NSString *name;

@end

NS_ASSUME_NONNULL_END
