//
//  SimpleDatabase.m
//  SimpleThreading
//
//  Created by DDC.Mac2 on 10/2/17.
//  Copyright © 2017 DDC.Mac2. All rights reserved.
//

#import "SimpleDatabase.h"

@implementation SimpleDatabase

- (void)loopAndPrintInBackground
{
    for(int i = 0; i < 100; i++)
    {
        NSLog(@"Looping in background for the %i time", i);
    }
}

- (void)lookAndPrintInBlock
{
    NSMutableArray *input = [[NSMutableArray alloc] init];
    for (int i = 0; i < 100; i++) {
        [input addObject:[NSNumber numberWithInt:i]];
    }

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [input enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
                NSLog(@"Looping in background using block for the %@ time", obj);
            }];
        });
    });
}

- (void)loopAndPrintInNSThread
{
    for(int i = 0; i < 100; i++)
    {
        NSLog(@"Looping in background using NSThread for the %i time", i);
    }
}

- (void)updateGUI:(UILabel *)multiThreadedLabel
{
    dispatch_async(dispatch_queue_create("getDbSize", NULL), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [multiThreadedLabel setText:@"Changed during background execution."];
        });
    });
}

@end
