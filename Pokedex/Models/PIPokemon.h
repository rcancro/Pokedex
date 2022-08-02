//
//  PIPokemon.h
//  Pokedex
//
//  Created by ricky cancro on 7/20/21.
//

#import <Foundation/Foundation.h>

// can import these two classes, but we don't need the full class for this
// we just need to know that the type and stat types exist
@class PIPokemonType;
@class PIPokemonStat;


NS_ASSUME_NONNULL_BEGIN

@interface PIPokemon : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
// Array declaration - making an array of pointers to something, ex
// array to pointers of PIPokemonType or stats
@property (nonatomic, strong, readonly) NSArray<PIPokemonType *> *types;
@property (nonatomic, strong, readonly) NSArray<PIPokemonStat *> *stats;

// 
@property (nonatomic, copy, readonly) NSString *name;  // 
@property (nonatomic, copy, readonly) NSURL *imageURL;  // Pokemon profile image

// Primitives, aren't pointers, are just assigned values
@property (nonatomic, readonly) NSUInteger number;
@property (nonatomic, readonly) NSUInteger height;
@property (nonatomic, readonly) NSUInteger weight;


@end

NS_ASSUME_NONNULL_END
