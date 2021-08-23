# HW #1b Make a Pokemon view

Now that we have a PIPokemon object, let’s create a view that displays this object! Your view should look like this:

<img width="1190" alt="Screen Shot 2021-08-23 at 12 38 10 PM" src="https://user-images.githubusercontent.com/285809/130531526-db622122-c749-4792-a925-273d349eb443.png">

## Getting Started
* Create a UIView subclass called `PIPokemonAutoLayoutView`
* Create `UILabels` for the Pokemon’s name, number and types
* Create `UIImageViews` for the Pokemon’s image, and type images
* Create 3 stack views represented in the image as the red, green, and blue boxes
* Create a method in your view called `updateWithPokemon:`. The method should take a Pokemon object and updates the labels/images appropriately
* Look in the Categories group in the Xcode project to find lots of useful category methods

## Design Specs:
### Types
* Horizontal spacing between type image and name is 4pts
* Horizontal spacing between types is 8pts
* Pokemon type images are 14ptx14pt
* Pokemon typeLabel uses the system font, 15pt
* Use the imageForType and colorForType category methods in PIPokemonType for type label colors

### Pokemon name
* pokemonNameLabel uses the system font, semibold, 20pt. The color is darkTextColor
* Vertical spacing between types and Pokemon name is 4pt

### Pokemon number label
* numberLabel uses the system font, bold, 36pt. The color is lightTextColor 

### Pokemon image
* Pokemon image size is 56ptx56pt

### PIPokemonAutoLayoutView
* Horizontal spacing between Pokemon image, name and type, and number is 16pt
* The entire view is inset 16pt


