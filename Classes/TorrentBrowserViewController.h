//
//  TorrentBrowser.h
//  uTorrentView
//
//  Created by Mike Godenzi on 9/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TorrentNetworkManager;
@class TorrentBrowserCell;

@interface TorrentBrowserViewController : UITableViewController<UISearchBarDelegate> {
	@private
	IBOutlet UISearchBar * torrentSearchBar;
	NSMutableArray * searchResult;
	TorrentNetworkManager * tnm;
	IBOutlet TorrentBrowserCell * cell;
}

@property(nonatomic, retain) IBOutlet UISearchBar * torrentSearchBar;
@property(nonatomic, retain) IBOutlet TorrentBrowserCell * cell;

@end
