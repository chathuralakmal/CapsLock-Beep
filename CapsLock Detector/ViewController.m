//
//  ViewController.m
//  CapsLock Detector
//
//  Created by Chathura on 10/17/16.
//  Copyright © 2016 Chathura. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    _statusItem.title = @"CapsLock";
    NSMenu *menu = [[NSMenu alloc]init];
    [menu addItemWithTitle:@"Quit CapsLock" action:@selector(terminate:) keyEquivalent:@""];
    _statusItem.menu = menu;
    [menu setDelegate:self];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
