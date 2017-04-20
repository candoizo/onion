
@interface CCUIControlCenterPagePlatterView : UIView {
	UIImageView* _whiteLayerView;
}
@end

@interface MPUControlCenterMetadataView : UILabel
@end
%hook CCUIControlCenterPagePlatterView

-(void)layoutSubviews {
	%orig;
  UIImageView* _whiteLayerView = MSHookIvar<id>(self, "_whiteLayerView");
	_whiteLayerView.hidden = YES;
}
%end

%hook MPUControlCenterMetadataView
-(id)label { //return black text label
	UILabel *copy = %orig;
	copy.textColor = [UIColor blackColor];
	return copy;
}
%end



//thanks sticktron for revealing this to me !
%hook NCMaterialSettings
- (double)cutOutOverlayAlpha {
return 0;
}
- (double)ccWhiteOverlayAlpha {
return 0;
}
%end
