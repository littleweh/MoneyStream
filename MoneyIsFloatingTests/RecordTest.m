//
//  RecordTest.m
//  MoneyIsFloatingTests
//
//  Created by 典萱 高 on 2018/6/18.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Record.h"
#import "Person.h"

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
    XCTAssertTrue([record.date isKindOfClass:NSDate.self], @"date type invalid");
    XCTAssertTrue([record.store isKindOfClass:NSString.self], @"store type invalid");
    XCTAssertTrue([record.dollarAmount isKindOfClass:NSNumber.self], @"dollar amount type invalid");
    XCTAssertTrue([record.explanation isKindOfClass:NSString.self], @"explanation type invalid");
    XCTAssertTrue([record.billSplitPayers isKindOfClass:NSMutableArray.self], @"billSplitPayers type invalid");
    XCTAssertTrue([record.billPayer isKindOfClass:Person.self], @"billPayer type invalid");
    XCTAssertTrue([record.createdDate isKindOfClass:NSDate.self], @"createdDate type invalid");
    XCTAssertTrue(([record.updatedDate isKindOfClass:NSDate.self] || record.updatedDate == nil), @"updatedDate type invalid, which is: %@", [record.updatedDate class]);
    XCTAssertTrue([record.identifier isKindOfClass:NSString.self], @"identifier type invalid, which is: %@", [record.identifier class]);

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM/dd";
    NSDate *date826 = [dateFormatter dateFromString:@"08/26"];

    XCTAssertEqual(record.date, date826, @"date wrong");

    dateFormatter.dateFormat = @"dd/MM/yyyy HH:mm:ss";
    NSDate *dateCreated = [dateFormatter dateFromString: @"24/08/2017 15:03:45"];

    XCTAssertEqual(record.createdDate, dateCreated, @"created date wrong, which is %@", [dateFormatter stringFromDate:record.createdDate]);
    XCTAssertNil(record.updatedDate, @"updatedDate is not nil");
    XCTAssert(record.expCategory == housing, @"expense category is wrong, which is %lu", (unsigned long)record.expCategory);
    XCTAssert([record.store isEqualToString:@"嘉義airbnb"], @"store is wrong, which is %@", record.store);
    XCTAssert([record.dollarAmount isEqualToValue:@2126], @"dollar amount is wrong, which is %@", record.dollarAmount);
    XCTAssert([record.explanation isEqualToString:@"嘉義airbnb"], @"explanation is wrong, which is %@", record.explanation);
    XCTAssert(record.paymentMode == creditCard, @"payment mode is wrong, which is %lu", (unsigned long)record.paymentMode);
    XCTAssertTrue(record.shouldSplitTheBill, @"should split the bill is wrong, which is false");
    XCTAssertTrue(record.isBillSplit, @"is bill split is wrong, which is false");

    NSArray * names = @[@"ST", @"Ada", @"Ilona"];
    XCTAssert([record.billSplitPayers[0].name isEqualToString:names[0]], @"billSplitPayer 1 is wrong, which is %@", record.billSplitPayers[0].name);
    XCTAssert([record.billSplitPayers[1].name isEqualToString: names[1]], @"billSplitPayer 1 is wrong, which is %@", record.billSplitPayers[1].name);
    XCTAssert([record.billSplitPayers[2].name isEqualToString: names[2]], @"billSplitPayer 1 is wrong, which is %@", record.billSplitPayers[2].name);

    XCTAssertEqual(record.billPayer.name, @"Ada", @"billPayer is wrong, which is %@", record.billPayer.name);

    XCTAssert([record.identifier isEqualToString: @"2"], @"identifier is wrong, which is %@", record.identifier);

}

@end
