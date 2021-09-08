# HW #3a Start
In this exercise, we will build on top of the Pokedex we have built and learn how to build a more complex app, with multiple screens.

## Getting Started
* Audio file for playing the sound of a pokemon will be provided.
* `PIPokemonViewController` will be provided.

## Tasks

### Add a gesture recognizer
* Add a gesture recognizer on the pokemon tableview cell, which plays the sound of the pokemon tapped on a long press.

### Present another view controller
* Implement `-tableView:didSelectRowAtIndexPath:` to present `PIPokemonViewController` for the pokemon found at the selected row.

### Create a view controller delegate
Here, we'll use the delegation pattern to connect the action taken in one view controller to another view controller.
* Create a delegate protocol `PIPokemonViewControllerDelegate`, for delegating dismissal of the `PIPokemonViewController` to the view controller that presented it, `PIPokemdexTableViewController`.
* Add a weak property in `PIPokemonViewController` for the delegate.
* Add a button in `PIPokemonViewController` that calls the delegate method for requesting dismissal of the `PIPokemonViewController`, on tap.
* Assign `PIPokedexTableViewController` to the delegate of `PIPokemonViewController`, and implement the delegate methods.

### Create a data manager class
Here, we'll create a singleton data manager class for storing and handling pokemon data in a single place.
* Create a class `PIPokemonDataManager` and a shared instance of it using `dispatch_once`.
* Create a method in `PIPokemonDataManager` for fetching pokedex data. Use this method to populate the data in `PIPokedexTableViewController` replacing `pokedex()`.
* Add a readwrite property `isPinned` to `PIPokemon` for marking the pokemon as pinned. Later, we'll use this to highlight any pokemon you pinned in `PIPokedexTableViewController`.
* Update the tableview cell class used in `PIPokedexTableViewController` to use this property to change the background as red if a pokemon was pinned.
* Create a method in `PIPokemonDataManager` that takes a pokemon as a parameter and sets `isPinned` property of the pokemon to true.
* Add a button in `PIPokemonViewController` that calls the data manager to update the pokemon's pinned status.
* Add a method to `PIPokemonViewControllerDelegate` for notifying delegates of the pinned action taken in `PIPokemonViewController`.
* Implement the new delegate method in `PIPokedexTableViewController`, to reload the tableview.
