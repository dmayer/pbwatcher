//
//  main.m
//  pbwatcher
//
//  Created by Daniel A. Mayer on 12/3/13.
//  Copyright (c) 2013 Daniel A. Mayer. All rights reserved.
//

#import <UIKit/UIKit.h>


int main (int argc, const char * argv[])
{
    // first command line argument is the sleep time
    int sleep_time =  [[NSString stringWithUTF8String:argv[1]] intValue];
    
    //TODO: subscribe to changes instead
    // pasteboard names are passed as command line arguments starting at 2.
    // store them in array
    NSMutableArray *pb_names = [[NSMutableArray alloc] init];

    for (int i=2; i<argc; i++) {
        NSString *str = [NSString stringWithUTF8String:argv[i]];
        [pb_names addObject:str];
    }

    UIApplicationInitialize();
    
    while(true) {
        // general pasteboard
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        NSLog(@"general:%@",pasteboard.string);
        
        // retrieve data for all other configured pasteboards
        for (int i=0; i<[pb_names count]; i++) {
            UIPasteboard *pasteboard = [UIPasteboard pasteboardWithName:pb_names[i] create:NO ];
            NSLog(@"%@:%@", pb_names[i], pasteboard.string);
        }
        
        sleep(sleep_time);
    }
    exit(0);
    
}
