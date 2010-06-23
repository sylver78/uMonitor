/*
DetailedViewController.h
Copyright (c) 2010, "Claudio Marforio - Mike Godenzi" (<marforio@gmail.com - godenzim@gmail.com>)
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

+ Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

+ Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

+ Neither the name of the <ORGANIZATION> nor the names of its contributors may
be used to endorse or promote products derived from this software without
specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#import <UIKit/UIKit.h>
#import "TorrentListener.h"

@class uTorrentViewAppDelegate;
@class TorrentNetworkManager;

@interface DetailedViewController : UITableViewController <UIActionSheetDelegate, UIAlertViewDelegate, TorrentListener> {
	@private
	IBOutlet UIView * customFooter;
	IBOutlet UIButton * startButton;
	IBOutlet UIButton * forcestartButton;
	IBOutlet UIButton * deleteButton;
	
	NSArray * torrent;
	TorrentNetworkManager * tnm;
	uTorrentViewAppDelegate * mainAppDelegate;
}

@property(nonatomic, retain) IBOutlet UIView * customFooter;
@property(nonatomic, retain) IBOutlet UIButton * startButton;
@property(nonatomic, retain) IBOutlet UIButton * forcestartButton;
@property(nonatomic, retain) IBOutlet UIButton * deleteButton;

@property(nonatomic, retain) TorrentNetworkManager * tnm;
@property(nonatomic, retain) uTorrentViewAppDelegate * mainAppDelegate;
@property(nonatomic, retain) NSArray * torrent;

- (id)initWithTorrent:(NSArray *)selectedTorrent;
- (void)startButtonAction;
- (void)forcestartButtonAction;
- (void)stopButtonAction;
- (void)deleteButtonAction;

@end
