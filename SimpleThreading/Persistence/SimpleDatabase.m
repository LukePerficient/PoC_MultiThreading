//
//  SimpleDatabase.m
//  SimpleThreading
//
//  Created by DDC.Mac2 on 10/2/17.
//  Copyright © 2017 DDC.Mac2. All rights reserved.
//

#import "SimpleDatabase.h"

@implementation SimpleDatabase

- (BOOL)loopAndPrintInBackground
{
    BOOL isComplete = NO;
    
    for(int i = 0; i < 100; i++)
    {
        NSLog(@"Looping in background for the %i time", i);
    }
    
    isComplete = YES;
    
    return isComplete;
}

- (BOOL)lookAndPrintInBlock
{
    BOOL isComplete = NO;
    
    NSMutableArray *input = [[NSMutableArray alloc] init];
    for (int i = 0; i < 100; i++) {
        [input addObject:[NSNumber numberWithInt:i]];
    }

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // Define Block
            void (^loopingPrintBlock)(id, NSUInteger, BOOL *);
            
            // Assign Block
            loopingPrintBlock = ^(id obj, NSUInteger idx, BOOL *stop){
                NSLog(@"Looping in background using block for the %@ time", obj);
            };
            
            // Call block
            [input enumerateObjectsUsingBlock:loopingPrintBlock];
        });
    });
    
    isComplete = YES;
    
    return isComplete;
}

- (BOOL)loopAndPrintInNSThread
{
    BOOL isComplete = NO;
    
    for(int i = 0; i < 100; i++)
    {
        NSLog(@"Looping in background using NSThread for the %i time", i);
    }
    
    isComplete = YES;
    
    return isComplete;
}

- (void)updateGUI:(UILabel *)multiThreadedLabel
{
    // Use inline blocks 
    dispatch_async(dispatch_queue_create("getDbSize", NULL), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [multiThreadedLabel setText:@"Changed during background execution."];
        });
    });
}

@end
