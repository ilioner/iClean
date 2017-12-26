//
//  AppDelegate.h
//  CleanUp
//
//  Created by Tywin on 2017/12/25.
//  Copyright © 2017年 Tywin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
    
@property (unsafe_unretained) IBOutlet NSTextView *mainTV;
    
- (IBAction)onClickClean:(NSButton *)sender;
    
@end

