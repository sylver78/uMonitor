//
//  uTorrentConstants.h
//  uTorrentView
//
//  Created by Claudio Marforio on 12/20/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface uTorrentConstants : NSObject {
	@public
	enum TORRENTS_ARRAY {
		HASH = 0,
		STATUS = 1,
		NAME = 2,
		SIZE = 3,
		PERCENT_PROGRESS = 4,
		DOWNLOADED = 5,
		UPLOADED = 6,
		RATIO = 7,
		UPLOAD_SPEED = 8,
		DOWNLOAD_SPEED = 9,
		ETA = 10,
		LABEL = 11,
		PEERS_CONNECTED = 12,
		PEERS_IN_SWARM = 13,
		SEEDS_CONNECTED = 14,
		SEEDS_IN_SWARM = 15,
		AVAILABILITY = 16,
		TORRENT_QUEUE_ORDER = 17,
		REMAINING = 18
	};	
}

@end