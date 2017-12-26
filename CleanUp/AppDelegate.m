//
//  AppDelegate.m
//  CleanUp
//
//  Created by Tywin on 2017/12/25.
//  Copyright © 2017年 Tywin. All rights reserved.
//

#import "AppDelegate.h"
#import "STPrivilegedTask.h"
@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (IBAction)onClickClean:(NSButton *)sender {
    
    STPrivilegedTask *task = [[STPrivilegedTask alloc] init];
    
    NSString *launchPath = @"/bin/sh";
    
    [task setLaunchPath:launchPath];
    [task setArguments:@[@"script.sh"]];
    [task setCurrentDirectoryPath:[[NSBundle mainBundle] resourcePath]];
    
    //授权
    OSStatus err = [task launch];
    if (err != errAuthorizationSuccess){
        if (err == errAuthorizationCanceled){
            NSLog(@"已取消");
            [self.mainTV setString:@"已取消"];
            return;
        } else {
            NSLog(@"发生一些问题: %d", (int)err);
            [self.mainTV setString:[NSString stringWithFormat:@"发生一些问题: %d", (int)err]];
            return;
        }
    }
    
    [task waitUntilExit];
    //开始执行命令，并且输出
    
    NSFileHandle *readHandle = [task outputFileHandle];
    NSData *output = [readHandle readDataToEndOfFile];
    NSString *outputString = [[NSString alloc] initWithData:output encoding:NSUTF8StringEncoding];
    
    [self.mainTV setString:outputString];
    
}
@end
