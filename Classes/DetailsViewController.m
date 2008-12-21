//
//  DetailsViewController.m
//  uTorrentView
//
//  Created by Mike Godenzi on 12/20/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "DetailsViewController.h"
#import "uTorrentConstants.h"


@implementation DetailsViewController

@synthesize torrent;
@synthesize actionButton;
@synthesize statusLabel;
@synthesize torrentTitle;
@synthesize torrentStatus;
@synthesize torrentSize;
@synthesize torrentProgress;
@synthesize torrentDownloaded;
@synthesize torrentUploaded;
@synthesize torrentRatio;
@synthesize torrentUspeed;
@synthesize torrentDspeed;
@synthesize torrentEta;
@synthesize torrentPeers;
@synthesize torrentSeeds;
@synthesize torrentAvail;
@synthesize torrentRem;

- (id)initWithTorrent:(NSArray *)selectedTorrent {
	if (self = [super initWithNibName:@"DetailsViewController" bundle:nil]) {
        self.torrent = selectedTorrent;
    }
    return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self.torrentTitle setText:(NSString *)[self.torrent objectAtIndex:NAME]];
	NSLog([self.torrent description]);
	[self.torrentStatus setText: [[self.torrent objectAtIndex:STATUS] stringValue]];
	[self.torrentSize setText: [[self.torrent objectAtIndex:SIZE] stringValue]];
	[self.torrentProgress setText: [[self.torrent objectAtIndex:PERCENT_PROGRESS] stringValue]];
	[self.torrentDownloaded setText: [[self.torrent objectAtIndex:DOWNLOADED] stringValue]];
	[self.torrentUploaded setText: [[self.torrent objectAtIndex:UPLOADED] stringValue]];
	[self.torrentRatio setText: [[self.torrent objectAtIndex:RATIO] stringValue]];
	[self.torrentUspeed setText: [[self.torrent objectAtIndex:UPLOAD_SPEED] stringValue]];
	[self.torrentDspeed setText: [[self.torrent objectAtIndex:DOWNLOAD_SPEED] stringValue]];
	[self.torrentEta setText: [[self.torrent objectAtIndex:ETA] stringValue]];
	[self.torrentPeers setText: [[self.torrent objectAtIndex:PEERS_CONNECTED] stringValue]];
	[self.torrentSeeds setText: [[self.torrent objectAtIndex:SEEDS_CONNECTED] stringValue]];
	[self.torrentAvail setText: [[self.torrent objectAtIndex:AVAILABILITY] stringValue]];
	[self.torrentRem setText: [[self.torrent objectAtIndex:REMAINING] stringValue]];
}


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


- (void)dealloc {
    [super dealloc];
}


@end