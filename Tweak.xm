//headers
@interface NCMaterialSettings : UIView
@property (assign,nonatomic) double cutOutOverlayAlpha;               //@synthesize cutOutOverlayAlpha=_cutOutOverlayAlpha - In the implementation block
@property (assign,nonatomic) double ccWhiteOverlayAlpha;
@end

@interface CCUIControlCenterPagePlatterView : UIView {
	UIImageView* _whiteLayerView;
	NCMaterialSettings* _materialSettings;
}
@end

@interface MPUControlCenterMetadataView : UILabel
@end

//tweak.xm
%hook CCUIControlCenterPagePlatterView
-(void)layoutSubviews {
	%orig;
	NCMaterialSettings* _materialSettings = MSHookIvar<id>(self, "_materialSettings"); //thos could
	_materialSettings.cutOutOverlayAlpha = 0;
	_materialSettings.ccWhiteOverlayAlpha = 0;
  UIImageView* _whiteLayerView = MSHookIvar<id>(self, "_whiteLayerView");
	_whiteLayerView.hidden = YES;
}
%end

%hook MPUControlCenterMetadataView
-(id)label { //return black text label and happened to not break noctis
	UILabel *copy = %orig;
	copy.textColor = [UIColor blackColor];
	return copy;
}
%end
