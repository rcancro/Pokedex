//
//  PIPokemonManualLayoutTableViewCell.h
//  Pokedex
//
//  Created by ricky cancro on 7/30/21.
//

#import <UIKit/UIKit.h>

@class PIPokemon;

NS_ASSUME_NONNULL_BEGIN

/**
 Manual layout is the old school way to layout views. While it may have been replaced, it is hard to beat in
 terms of performance. It is also much more straighforward than autolayout IMO.
 
 In manual layout, there are 2 key methods: layoutSubviews and sizeThatFits:. They do different things, but
 often contain similar code.
 
 In layoutSubviews you should compute the frame for every subview in your view. In sizeThatFits:, you should
 compute the size required to display this view given a max size that is passed in. In general the size usually
 has a fixed width and a very large height -- in other words you get a constrained width that you use to compute
 a height for that width.
 
 The problem is that once you have determined a height for the entire view, you have probably pretty much
 computed each subview's frame. If you duplicate this code in the two methods you are going to find yourself
 forgetting to update logic in one of the two methods and trying to understand why your views are not the right
 size. What we've done in this class isn't really a standard, but it seems like a good idea. We have created
 one method to compute the size of the view and optionally set the frames of each subview. We can the same
 method in both layoutSubviews and sizeThatFits:, but we only apply the frames in layoutSubviews.
 */
@interface PIPokemonManualLayoutView : UIView

- (void)updateWithPokemon:(PIPokemon *)pokemon;

@end

NS_ASSUME_NONNULL_END
