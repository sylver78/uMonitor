//
//  LabelCell.h
//  uTorrentView
//
//  Created by Claudio Marforio on 12/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kMyAlert	123

@interface LabelCell : UITableViewCell {
	IBOutlet UILabel * labelLabel;
	IBOutlet UIImageView * labelImage;
	IBOutlet UIImage * colorizedImage;
	IBOutlet UIButton * test;
	UIColor * labelColor;
}

@property (nonatomic,retain) UIColor * labelColor;
@property (nonatomic,retain) UIImage * colorizedImage;

- (void)setCellDataWithLabelString:(NSString *)label withNumber:(NSDecimalNumber *)count colorString:(UIColor *)color;
- (void)testAction;


@end
