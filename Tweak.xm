
@interface CCUIControlCenterPagePlatterView : UIView {
	UIImageView* _whiteLayerView;
}
@end


%hook CCUIControlCenterPagePlatterView

-(void)layoutSubviews {
	%orig;
  UIImageView* _whiteLayerView = MSHookIvar<id>(self, "_whiteLayerView");
  //[_whiteLayerView setHidden:YES];
	_whiteLayerView.hidden = YES;
}

%end
