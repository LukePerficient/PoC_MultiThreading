//
//  SimpleThreadingTests.m
//  SimpleThreadingTests
//
//  Created by DDC.Mac2 on 10/2/17.
//  Copyright © 2017 DDC.Mac2. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SimpleDatabase.h"

@interface SimpleThreadingTests : XCTestCase

@property (strong,nonatomic) SimpleDatabase *database;
@property (strong,nonatomic) NSThread *backgroundThread;

@end

@implementation SimpleThreadingTests

- (void)setUp {
    [super setUp];
    _database = [[SimpleDatabase alloc] init];
    _backgroundThread = [[NSThread alloc] initWithTarget:_database
                                                selector:@selector(loopAndPrintInNSThread) object:nil];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    _database = nil;
    [super tearDown];
}

- (void)testExecuteBackgroundThreadWithPerformSelectorInBackgroundMethod {
    // Multithreading with separate method running in background
    [_database performSelectorInBackground:@selector(loopAndPrintInBackground) withObject:nil];
}

- (void)testExecuteBackgroundThreadWithDispatchAsyncMethod {
    // Multithreading using blocks to return information
    [_database lookAndPrintInBlock];
}

- (void)testExecuteBackgroundThreadWithNSThreadClass {
    // Multithreading using NSThread class
    [_backgroundThread start];
}

@end
