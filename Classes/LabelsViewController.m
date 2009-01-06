//
//  LabelsViewController.m
//  uTorrentView
//
//  Created by Claudio Marforio on 12/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "LabelsViewController.h"
#import "LabelCell.h"
#import "Utilities.h"

#import <math.h>


@implementation LabelsViewController

@synthesize labelsTable;
@synthesize mainAppDelegate;
@synthesize cell;

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/


- (void)viewDidLoad {
	[super viewDidLoad];
	
	mainAppDelegate = (uTorrentViewAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	tnm = [mainAppDelegate getTNM];
	[tnm addListener:self];
	
	// set the title
	self.navigationItem.title = @"Labels";
	// set the refresh button
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(networkRequest)];
}

- (void)networkRequest {
	self.navigationItem.rightBarButtonItem.enabled = FALSE;
	[Utilities showLoadingCursorForViewController:self];
	// create the request
	[tnm requestList];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)update:(NSUInteger)type {
	[labelsTable reloadData];
	self.navigationItem.rightBarButtonItem.enabled = YES;
	self.navigationItem.leftBarButtonItem = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	int unlabelled = 0;
	if ((unlabelled = [[tnm updateUnlabelledTorrents] intValue]) == 0)
		return [tnm.labelsData count]; // no unlabelled torrents
	else
		return [tnm.labelsData count] + 1; // unlabelled torrents
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"LabelsCell";
    
	cell = (LabelCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"LabelCell" owner:self options:nil];
		if (indexPath.row < [tnm.labelsData count]) {
			NSArray * color = [[NSUserDefaults standardUserDefaults] arrayForKey:[[tnm.labelsData objectAtIndex:indexPath.row] objectAtIndex:0]];
			float colorHue, colorBrightness = 0.0f;
			if (color != nil) {
				colorHue = [[color objectAtIndex:0] floatValue];
				colorBrightness = [[color objectAtIndex:1] floatValue];
			} else {
				colorHue = 0.5f;
				colorBrightness = 0.4f;
			}
			UIColor * theColor = [[UIColor alloc] initWithHue:colorHue saturation:1.0f brightness:colorBrightness alpha:1.0f];
			[cell setCellDataWithLabelString:[[tnm.labelsData objectAtIndex:indexPath.row] objectAtIndex:0] 
								  withNumber:[[tnm.labelsData objectAtIndex:indexPath.row] objectAtIndex:1]
								 colorString:theColor];
		} else { // no label case
			NSArray * color = [[NSUserDefaults standardUserDefaults] arrayForKey:@"No label"];
			float colorHue, colorBrightness = 0.0f;
			if (color != nil) {
				colorHue = [[color objectAtIndex:0] floatValue];
				colorBrightness = [[color objectAtIndex:1] floatValue];
			} else {
				colorHue = 0.5f;
				colorBrightness = 0.4f;
			}
			UIColor * theColor = [[UIColor alloc] initWithHue:colorHue saturation:1.0f brightness:colorBrightness alpha:1.0f];
			[cell setCellDataWithLabelString:@"No Label"
								  withNumber:(NSDecimalNumber *)[tnm updateUnlabelledTorrents]
								 colorString:theColor];
		}
	}
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
	[self.navigationController dismissModalViewControllerAnimated:YES]; 
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	LabelCell * myCell = (LabelCell *)[tableView cellForRowAtIndexPath:indexPath];
	[myCell colorChangedAction];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
    [super dealloc];
	[tnm dealloc];
}


@end

