//
//  PBRadioGroupView.m
//  Predicitve Budget
//
//  Created by András Gyetván on 2015. 02. 19..
//  Copyright (c) 2015. DroidZONE. All rights reserved.
//

#import "MLRadioGroupManager.h"

@implementation MLRadioGroupManager

- (IBAction)buttonClicked:(NSButton *)sender {
	if(sender.state != NSOnState) {
		sender.state = NSOnState;
		return;
	}
	if(sender.state == NSOnState) {
		for(NSView* v in self.groupView.subviews) {
			if(v == sender) continue;
			if([v isKindOfClass:[NSButton class]]) {
				NSButton* b = (NSButton*)v;
				b.state = NSOffState;
			}
		}
	}
	_selectedItem = sender.tag;
	[self.target performSelectorOnMainThread:self.action withObject:self waitUntilDone:YES];
}

- (void) setSelectedItem:(NSInteger)selectedItem {
	_selectedItem = selectedItem;
	for(NSView* v in self.groupView.subviews) {
		if([v isKindOfClass:[NSButton class]]) {
			NSButton* b = (NSButton*)v;
			if(b.tag == selectedItem) {
				b.state = NSOnState;
			} else {
				b.state = NSOffState;
			}
		}
	}
}
@end
