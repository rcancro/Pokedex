//
//  PIPokemonAutoLayoutView.h
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PIPokemon;

/**
 This is a Pokemon cell created using autolayout. Autolayout has been around since
 iOS6. Autolayout is a constraint based layout system. You define relationships between
 components like "label X is >= 16 points from label Y".
 
 The tricky part is that ou have to make sure your layout is not over constrained and not
 underconstrained. An example of an overconstrained view would be, if you have one constraint
 that says "label X is 8 points from label Y" and another that says  "label X is >16 pts from
 label Y". Both cannot be true, so you will get a really cryptic warning in the console that
 the system is dropping a constraint. You have to figure out why.
 
 If your view  is underconstrained, then the view cannot determine its intrinisic content size.
 Let's say you have a view that has a single label in it. You constrain the label to have
 16 pts padding on the top, left and right sides. Everything looks great! BUT, the view
 will compute its own height to be 0. The reason is that the view can satisfy all these constraints
 with a height of 0. You must add a 16pt padding constraint to the bottom to fully constrain
 the view, and allow it to compute its proper height (the width would have been computed
 correctly from the start since it was fully constrained). Think of constraints are lines between
 components. Something is fully constrained if you can follow a path of these constrain lines
 from the top of the view to the bottom, and the left to the right.
 
 Autolayout confused a lot of people. Its learning curve was super high, and the performance
 was awful. Though it has improved in recent years, the performance is still not good.
 
 Apple introduce UIStackView a few years ago to try to make autolayout easier. However,
 its performance is even worse than normal autolayout. It also adds views to your hierarchy
 that do nothing other than control layout (they claimed at one point these were optimized
 out, but I don't know if that is true).
 
 (This is a little old, but you get the idea: https://i.stack.imgur.com/xyR5l.png)
 
 That being said, I used UIStackViews in this class 1) because it is easier than making constraints
 and 2) it is kind of close to how we actually lay things out in the Pinterest app.

 I believe autolayout is used in a lot of apps out there. It is "the way" according to Apple (though
 it is being replaced by SwiftUI -- SwiftUI not using autolayout says a lot IMO).
 I think autolayout is over engineered and Apple should just implement flexbox already.
 
 Note on SwiftUI: The problem with all the new shiny apple APIs is that in order to use them
 the lowest OS version we support must support that feature. In the case of SwiftUI that is iOS13.
 We generally keep support for a long time, so we won't be able to use SwiftUI until the lowest OS we
 support is iOS13. Even then, the first iteration of SwiftUI in iOS13 is not the best. It won't be
 until iOS14, 15 is our lowest version when we may really start being able to use all the features (and
 by then iOS16, 17 will have even better SwiftUI things we can't use.)
 
 */
@interface PIPokemonAutoLayoutView : UIView

- (void)updateWithPokemon:(PIPokemon *)pokemon;

@end

NS_ASSUME_NONNULL_END
