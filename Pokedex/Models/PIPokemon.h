//
//  PIPokemon.h
//  Pokedex
//
//  Created by ricky cancro on 7/20/21.
//

#import <Foundation/Foundation.h>

// In header files, you often don't need to import the entire file
// In this case, these two classes are just being used to specifiy the type
// of objects that'll be in an array. The compiler needs to know they are classes,
// but it doesn't need to know anything else. But not fully importing them, we won't
// cause this file to recompile if the header of PIPokemonType or PIPokemonStat changes
@class PIPokemonType;
@class PIPokemonStat;

NS_ASSUME_NONNULL_BEGIN

@interface PIPokemon : NSObject

// strong means that we are incrementing the reference count on this array.
// that is, it cannot be deleted underneath us because we hold a strong reference to it
@property (nonatomic, strong, readonly) NSArray<PIPokemonType *> *types;
@property (nonatomic, strong, readonly) NSArray<PIPokemonStat *> *stats;

// This property we use copy instead of strong. The main reason is that someone could be
// setting name to a NSMutableString, which could then change underneath us later. If we
// copy, then we know that this cannot happen.
@property (nonatomic, copy, readonly) NSString *name;

// NSURL uses copy as well since NSMutableURL is a thing
@property (nonatomic, copy, readonly) NSURL *imageURL;

// All primitive types use "assign" by default. There is no reason to explicitly add it to the property
@property (nonatomic, readonly) NSUInteger number;
@property (nonatomic, readonly) NSUInteger height;
@property (nonatomic, readonly) NSUInteger weight;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
