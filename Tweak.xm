//headers
@interface MPUControlCenterMetadataView : UILabel
@end

//tweak.xm
%hook MPUControlCenterMetadataView
-(id)label { //return black text label because its gotta be readable
	UILabel *copy = %orig;
	if (copy.textColor != [UIColor blackColor]) {
	copy.textColor = [UIColor blackColor];
	}
	return copy;
}
%end

%hook NCMaterialSettings
- (double)cutOutOverlayAlpha {return 0;}
- (double)ccWhiteOverlayAlpha {return 0;}
%end
