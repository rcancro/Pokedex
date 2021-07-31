//
//  PIPokemonType+TypeIcon.m
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import "PIPokemonType+TypeIcon.h"
#import "UIColor+Pokemon.h"

@implementation PIPokemonType (TypeIcon)

- (PIPokemonTypeId)typeId
{
    if ([self.name isEqualToString:@"normal"]) {
        return PIPokemonTypeNormal;
    } else if ([self.name isEqualToString:@"fighting"]) {
        return PIPokemonTypeFighting;
    } else if ([self.name isEqualToString:@"flying"]) {
        return PIPokemonTypeFlying;
    } else if ([self.name isEqualToString:@"poison"]) {
        return PIPokemonTypePoison;
    } else if ([self.name isEqualToString:@"ground"]) {
        return PIPokemonTypeGround;
    } else if ([self.name isEqualToString:@"rock"]) {
        return PIPokemonTypeRock;
    } else if ([self.name isEqualToString:@"bug"]) {
        return PIPokemonTypeBug;
    } else if ([self.name isEqualToString:@"ghost"]) {
        return PIPokemonTypeGhost;
    } else if ([self.name isEqualToString:@"steel"]) {
        return PIPokemonTypeSteel;
    } else if ([self.name isEqualToString:@"fire"]) {
        return PIPokemonTypeFire;
    } else if ([self.name isEqualToString:@"water"]) {
        return PIPokemonTypeWater;
    } else if ([self.name isEqualToString:@"grass"]) {
        return PIPokemonTypeGrass;
    } else if ([self.name isEqualToString:@"electric"]) {
        return PIPokemonTypeElectric;
    } else if ([self.name isEqualToString:@"psychic"]) {
        return PIPokemonTypePsychic;
    } else if ([self.name isEqualToString:@"ice"]) {
        return PIPokemonTypeIce;
    } else if ([self.name isEqualToString:@"dragon"]) {
        return PIPokemonTypeDragon;
    } else if ([self.name isEqualToString:@"dark"]) {
        return PIPokemonTypeDark;
    } else if ([self.name isEqualToString:@"fairy"]) {
        return PIPokemonTypeFairy;
    }
    
    NSAssert(0, @"OMG THEY ADDED A NEW POKEMON TYPE!!!!!");
    return PIPokemonTypeNormal;
}

- (UIImage *)imageForType
{
    // This is kind of sloppy. The name and the image are the same,
    // but that's a coincidence and we probably shouldn't rely on it.
    // however, comparing self.name to hardcoded values isn't any better
    return [UIImage imageNamed:self.name];
}

- (UIColor *)colorForType
{
    switch (self.typeId) {
        case PIPokemonTypeNormal:
            return [UIColor normalColor];
        case PIPokemonTypeFighting:
            return [UIColor fightingColor];
        case PIPokemonTypeFlying:
            return [UIColor flyingColor];
        case PIPokemonTypePoison:
            return [UIColor poisonColor];
        case PIPokemonTypeGround:
            return [UIColor groundColor];
        case PIPokemonTypeRock:
            return [UIColor rockColor];
        case PIPokemonTypeBug:
            return [UIColor bugColor];
        case PIPokemonTypeGhost:
            return [UIColor ghostColor];
        case PIPokemonTypeSteel:
            return [UIColor steelColor];
        case PIPokemonTypeFire:
            return [UIColor fireColor];
        case PIPokemonTypeWater:
            return [UIColor waterColor];
        case PIPokemonTypeGrass:
            return [UIColor grassColor];
        case PIPokemonTypeElectric:
            return [UIColor electricColor];
        case PIPokemonTypePsychic:
            return [UIColor psychicColor];
        case PIPokemonTypeIce:
            return [UIColor iceColor];
        case PIPokemonTypeDragon:
            return [UIColor dragonColor];
        case PIPokemonTypeDark:
            return [UIColor darkColor];
        case PIPokemonTypeFairy:
            return [UIColor fairyColor];
    }
    return UIColor.darkTextColor;
}


@end
