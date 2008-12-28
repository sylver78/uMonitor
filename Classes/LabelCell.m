//
//  LabelCell.m
//  uTorrentView
//
//  Created by Claudio Marforio on 12/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "LabelCell.h"
#import "BlueBadge.h"

#import "Utilities.h"

//#import "UIAlertView_Extended.h"

#import "CustomAlertView.h"


@implementation LabelCell

@synthesize labelColor;
@synthesize colorizedImage;
@synthesize labelImage;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		
    }
	return self;
}

- (void)setCellDataWithLabelString:(NSString *)label withNumber:(NSDecimalNumber *)count colorString:(UIColor *)color {
	self.labelColor = color;

	[test addTarget:self action:@selector(testAction) forControlEvents:UIControlEventTouchDown];
	
	
	labelLabel.text = label;
	

	self.colorizedImage = [Utilities colorizeImage:labelImage.image color:color];
	UIImage * tmpImage = labelImage.image;
	labelImage.image = colorizedImage;
	self.colorizedImage = tmpImage;
	
	
	CGRect contentRect = self.contentView.bounds;
	CGFloat boundsX = contentRect.origin.x;
	CGRect frame = CGRectMake(boundsX + 250, 12, 40, 40);
	BlueBadge *blueBadge = [[BlueBadge alloc] initWithFrame:frame];
	[blueBadge drawWithCount:[count intValue]];
	[self.contentView addSubview:blueBadge];
	[blueBadge release];
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	CustomAlertView *alertView = (CustomAlertView*) actionSheet;
	if(buttonIndex > 0) {
		if(alertView.tag == 1) {
			float hS = alertView.hueSlider.value;
			float bS = alertView.brightnessSlider.value;
			self.labelColor = [[UIColor alloc] initWithHue:hS saturation:1.0f brightness:bS alpha:1.0];
			labelImage.image = [Utilities colorizeImage:self.colorizedImage color:self.labelColor];
			//NSLog(@"hueSlider: %f, brightnessSlider: %f", hS, bS);
		}
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog("called");
	UITouch * touch = [[event allTouches] anyObject];
	if ([touch view] == self.labelImage) {
		[self testAction];
	}
}

- (void)testAction {
	CustomAlertView *alert = [[CustomAlertView alloc] initWithTitle:@"Choose Color" 
																message:@"Color" 
															   delegate:self 
													  cancelButtonTitle:@"Cancel"
													  otherButtonTitles:@"OK", nil];

	alert.hueSlider.value = [[[Utilities RGBtoHSB:self.labelColor] objectAtIndex:0] floatValue];
	alert.brightnessSlider.value = [[[Utilities RGBtoHSB:self.labelColor] objectAtIndex:2] floatValue];
	// tag the alert in case you have multiple alert sheet calls
	alert.tag = 1;
	[alert show];
	[alert release];
}

/*
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if(buttonIndex > 0) {
		if(actionSheet.tag == kMyAlert) {
			NSString *textValue = [actionSheet textField].text;
			if(textValue==nil)
				return;
			NSInteger value = [textValue integerValue];
		}
	}
}*/

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
