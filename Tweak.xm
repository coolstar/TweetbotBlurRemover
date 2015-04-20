/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.
*/

@interface CSContentViewContainer : UIView
@end

@implementation CSContentViewContainer
- (id)contentView {
	return self;
}
@end

@interface UIVisualEffectView : UIView
@end

%hook UIVisualEffectView
- (id)initWithEffect:(id)effect {
	self = %orig;
	CSContentViewContainer *replacementView = [[CSContentViewContainer alloc] initWithFrame:self.frame];
	replacementView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
	[self autorelease];
	return replacementView;
}
%end
