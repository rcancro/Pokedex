### Homework 1a -- Let's make some model objects
Often you will get data from the backend as JSON. But we don’t want to deal with raw JSON. Instead, we will make model objects that will take JSON that has been parsed into a NSDictionary and set the object’s properties with this data.

For our Pokedex app we will need three model objects:
* PIPokemon
* PIPokemonType
* PIPokemonStat

Stubs for each object have already been created with an initializer of the form:
```
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
```

In `AppDelegate.m` you'll see that each type is created and passed some example data:

```
    NSDictionary *pokemonTypeData = exampleTypeData();
    PIPokemonType *pokemonType = [[PIPokemonType alloc] initWithDictionary:pokemonTypeData];
    NSLog(@"Pokemon type:\n%@", pokemonType);

    NSDictionary *pokemonStatData = exampleStatData();
    PIPokemonStat *pokemonStat = [[PIPokemonStat alloc] initWithDictionary:pokemonStatData];
    NSLog(@"Pokemon type:\n%@", pokemonStat);

    NSDictionary *pokemonData = [pokeData() firstObject];
    PIPokemon *pokemon = [[PIPokemon alloc] initWithDictionary:pokemonData];
    NSLog(@"Pokemon:\n%@", pokemon);
 ```
 
Your job is to create properties for each class, and extract the data from the NSDictionary and place it in your model object.


### PIPokemonType
PIPokemonType is super simple for our purposes, so let’s start there. The class only needs 1 property:
A string property called name

Your object should be able to take this input dictionary and populate name and value:

```
NSDictionary *type = @{
    @"slot": @1,
    @"type": @{
            @"name": @"electric",
            @"url": @"https://pokeapi.co/api/v2/type/13/"
    }
};
```

The end result would be a PIPokemonType object with “electric” as its name.

### PIPokemonStat
PIPokemonStat is almost as simple as PIPokemonType. This class has two properties:
* A string property called name
* An unsigned integer property called value

Your object should be able to take this input dictionary and populate name and value:
```
NSDictionary *statData = @{
    @"base_stat": @35,
    @"effort": @0,
    @"stat": @{
            @"name": @"hp",
            @"url": @"https://pokeapi.co/api/v2/stat/1/"
    }
};
```

The end result would be a PIPokemonStat object with its name as “hp” and its value as 35.

### PIPokemon
PIPokemon is the main model object. It will have the following properties:
* An array of PIPokemonTypes called types
* An array of PIPokemonStats called stats
* A NSString called name
* A NSURL called imageURL
* An unsigned integer for the pokemon’s number called number;
* An unsigned integer for the pokemon’s height called height;
* An unsigned integer for the pokemon’s weight called weight;

The dictionary to parse is locationed in PIPokeData.h

There are several images in the pokemon data. We want to use the one here:
```
dictionary[@"sprites"][@"other"][@"official-artwork"][@"front_default"]
```

A pokemon can have multiple types and stats. You’ll have to iterate over all of them and create new model objects for each one. Add these model objects to the PIPokemon’s stats or types array.

### Extra Credit

Create a `description` method for each model type that prints a nice dump of each model in the debugger/console. The output for `PIPokemon` could look something like this:
```
Name: pikachu Number: 25
Weight: 60 Height: 4
Types:
	electric
Stats:
	hp : 35
	attack : 55
	defense : 40
	special-attack : 50
	special-defense : 50
	speed : 90
```
