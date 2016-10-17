//
//  AppDelegate.m
//  CapsLock Detector
//
//  Created by Chathura on 10/17/16.
//  Copyright © 2016 Chathura. All rights reserved.
//

#import "AppDelegate.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    NSString *soundFilePath = [NSString stringWithFormat:@"%@/beep-06.mp3",[[NSBundle mainBundle] resourcePath]];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    player.numberOfLoops = 1; //Infinite
    
    NSDictionary *options = @{(__bridge id)kAXTrustedCheckOptionPrompt: @NO};
    BOOL accessibilityEnabled = AXIsProcessTrustedWithOptions((__bridge CFDictionaryRef)options);
    if (!accessibilityEnabled) {
        NSString *urlString = @"x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility";
        [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:urlString]];
    }
    
    
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSFlagsChangedMask
                                           handler:^(NSEvent* aEvent){
                                               if( [aEvent modifierFlags] & NSAlphaShiftKeyMask )
                                               {
                                                   NSLog( @"Capslock was Enabled" );
                                                   
                                                   [player play];
                                               }
                                           }];
    
    [NSEvent addLocalMonitorForEventsMatchingMask:NSFlagsChangedMask
                                          handler:^(NSEvent* aEvent){ 
                                              if( [aEvent modifierFlags] & NSAlphaShiftKeyMask )
                                              {
                                                  NSLog( @"Capslock was Enabled" );
                                                  
                                                  [player play];
                                              }
                                              return aEvent; 
                                          }];
    
 
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
