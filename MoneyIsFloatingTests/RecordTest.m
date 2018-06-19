//
//  RecordTest.m
//  MoneyIsFloatingTests
//
//  Created by 典萱 高 on 2018/6/18.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Record.h"

@interface RecordTest : XCTestCase
@property (nonatomic, strong) NSDictionary * dictionary;
@end

@implementation RecordTest

- (void)setUp {
    [super setUp];
    self.dictionary = @{
                        @"amount": @2126,
                        @"bill_split_payers": @"ST, Ada, Ilona",
                        @"category": @"住宿",
                        @"created_date": @"24/08/2017 15:03:45",
                        @"date": @"8/26",
                        @"explanation": @"嘉義airbnb",
                        @"is_bill_split": @"是",
                        @"key": @2,
                        @"payer": @"Ada",
                        @"payment_mode": @"信用卡",
                        @"should_split_bill": @"是",
                        @"store": @"嘉義airbnb",
                        @"updated_date": @""
        };
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testInitWithDictionary
{
    Record *record = [[Record alloc]initWithDictionary:self.dictionary];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM/dd";
    NSDate *date826 = [dateFormatter dateFromString:@"08/26"];

    XCTAssertTrue([record.date isKindOfClass:NSDate.self], @"date type invalid");
    XCTAssertEqual(record.date, date826, @"date wrong");

    dateFormatter.dateFormat = @"MM/dd/yyyy HH:mm:ss";
    NSDate *dateCreated = [dateFormatter dateFromString: @"24/08/2017 15:03:45"];

    XCTAssertTrue([record.createdDate isKindOfClass:NSDate.self], @"created date type invalid");
    XCTAssertEqual(record.createdDate, dateCreated, @"created date wrong");




    XCTAssert([record.dollarAmount isKindOfClass:NSNumber.self], @"dollarAmount is not NSNumber" );

}

@end
