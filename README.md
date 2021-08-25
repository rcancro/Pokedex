# HW #2b Let's build our Pokedex

With your `PIPokedexTableViewController` displaying content, you are ready to move foward and build your Pokedex.

## Getting Started
* The goal of this exercise is to display real data in your table view.
* `PIPokeData` has been updated and now it has a `pokedex` function. This function returns an array of `PIPokemon` objects.

## Display real data

### Initialize your data source
* Create a `NSArray` property named `pokedex` to hold your data.
* Initialize your `pokedex` in your `PIPokedexTableViewController` init method:
    `_pokedex = pokedex();`

### Update your item count
* Previously, your item count was hardcoded. Update it to match your new data source size.
```
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pokedex.count;
}
```

### Update your cell item
* You now can display the Pokemon name in the `UITableViewCell`.
```
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PIPokemon *pokemon = self.pokedex[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kCellId" forIndexPath:indexPath];
    cell.textLabel.text = pokemon.name;
    return cell;
}
```

