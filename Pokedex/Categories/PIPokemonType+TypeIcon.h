//
//  PIPokemonType+TypeIcon.h
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import <UIKit/UIKit.h>
#import "PIPokemonType.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PIPokemonTypeId) {
    PIPokemonTypeNormal = 0,
    PIPokemonTypeFighting,
    PIPokemonTypeFlying,
    PIPokemonTypePoison,
    PIPokemonTypeGround,
    PIPokemonTypeRock,
    PIPokemonTypeBug,
    PIPokemonTypeGhost,
    PIPokemonTypeSteel,
    PIPokemonTypeFire,
    PIPokemonTypeWater,
    PIPokemonTypeGrass,
    PIPokemonTypeElectric,
    PIPokemonTypePsychic,
    PIPokemonTypeIce,
    PIPokemonTypeDragon,
    PIPokemonTypeDark,
    PIPokemonTypeFairy,
};

@interface PIPokemonType (TypeIcon)

@property (nonatomic, readonly) PIPokemonTypeId typeId;

- (UIImage *)imageForType;

- (UIColor *)colorForType;

@end

NS_ASSUME_NONNULL_END
