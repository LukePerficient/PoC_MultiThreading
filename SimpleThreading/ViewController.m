//
//  ViewController.m
//  SimpleThreading
//
//  Created by DDC.Mac2 on 10/2/17.
//  Copyright © 2017 DDC.Mac2. All rights reserved.
//

#import "ViewController.h"
#import "SimpleDatabase.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *multiThreadedLabel;
@property (strong, nonatomic) SimpleDatabase *database;

@end

@implementation ViewController

// Mark: Setup
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeVariables];

    // Multithreading with separate method running in background
    [_database performSelectorInBackground:@selector(loopAndPrintInBackground) withObject:nil];
    NSLog(@"");
    
    // Multithreading using blocks to return information
    [_database lookAndPrintInBlock];
    
    
}

- (void)initializeVariables
{
    _database = [[SimpleDatabase alloc] init];
}

// Mark: Actions
- (IBAction)updateText:(UIButton *)sender {
    // Multithreading updating of main thread using asynchronous blocks
    [_database updateGUI:_multiThreadedLabel];
}


@end
