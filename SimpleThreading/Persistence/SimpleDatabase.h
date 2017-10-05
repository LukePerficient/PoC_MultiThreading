//
//  SimpleDatabase.h
//  SimpleThreading
//
//  Created by DDC.Mac2 on 10/2/17.
//  Copyright © 2017 DDC.Mac2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SimpleDatabase : NSObject

- (BOOL)loopAndPrintInBackground;
- (BOOL)lookAndPrintInBlock;
- (BOOL)loopAndPrintInNSThread;
- (void)updateGUI:(UILabel *)multiThreadedLabel;

@end
