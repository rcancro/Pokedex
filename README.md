# HW #2c Pokedex with custom cell

By now, your `PIPokedexTableViewController` is displaying real Pokemon names. We are ready to display a custom cell.

## Custom cell
* Create a new `UITableViewCell` subclass named `PIPokemonAutoLayoutTableViewCell`.
* Create a `PIPokemonAutoLayoutView` view to display the Pokemon data.
* Override `- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier` and initialize your `PIPokemonAutoLayoutView` view.
* Set up the AutoLayout constraints to make the cell's `contentView` width and height match the `PIPokemonAutoLayoutView` width and height.

```
@implementation PIPokemonAutoLayoutTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _pokemonView = [[PIPokemonAutoLayoutView alloc] init];
        _pokemonView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_pokemonView];
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    [NSLayoutConstraint activateConstraints:@[
        // set the content view to have same width and height to the pokemonView
        [self.contentView.widthAnchor constraintEqualToAnchor:self.pokemonView.widthAnchor],
        [self.contentView.heightAnchor constraintEqualToAnchor:self.pokemonView.heightAnchor]
    ]];
}

@end
```

## Display the custom

### Register your custom cell

`[self.tableView registerClass:[PIPokemonAutoLayoutTableViewCell class] forCellReuseIdentifier:@"PokemonCell"];`

### Return your custom cell
```
PIPokemon *pokemon = self.pokedex[indexPath.row];
PIPokemonAutoLayoutTableViewCell *pokemonCell = (PIPokemonAutoLayoutTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"PokemonCell"];
[pokemonCell.pokemonView updateWithPokemon:pokemon];
return pokemonCell;
```


## Extra credit
* Create a `UIViewController` subclass called `PIPokedexViewController` and set-up your own `UITableView` to display the same content.

## Above and beyond
* Create a `UICollectionViewController` subclass called `PIPokedexCollectionViewController` and display your content using the collection view.

## You have no limits
* Create a `UIViewController` subclass called `PISuperPokedexViewController`and set-up your own `UICollectionView` to display the same content.
