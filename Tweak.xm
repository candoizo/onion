//headers
@interface MPUControlCenterMetadataView : UILabel
@end

//tweak.xm
%group FINE
%hook MPUControlCenterMetadataView
-(id)label { //return black text label because its gotta be readable
	UILabel *copy = %orig;
	if (copy.textColor != [UIColor blackColor]) {
	copy.textColor = [UIColor blackColor];
	}
	return copy;
}
%end
%end
%group MATS
%hook NCMaterialSettings
- (double)cutOutOverlayAlpha {return 0;}
- (double)ccWhiteOverlayAlpha {return 0;}
-(void)layoutSubviews {
	%orig;
	UIImageView* _whiteLayerView = [self valueForKey:@"_whiteLayerView"];
	_whiteLayerView.hidden = YES;
}
%end
%end
%group ONION
%hook CCUIControlCenterPagePlatterView
-(void)layoutSubviews {
	%orig;
	UIImageView* _whiteLayerView = [self valueForKey:@"_whiteLayerView"];
	_whiteLayerView.hidden = YES;
}
%end
%end
%ctor {
	%init(FINE);
	if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 10.2) {
		%init(MATS);
	}
	else {
		%init(ONION);
	}
}
