//
//  PIStat.h
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PIPokemonStat : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSUInteger value;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
