//
//  Record.h
//  MoneyIsFloating
//
//  Created by 典萱 高 on 2018/6/5.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

typedef enum : NSUInteger {
    transportation,
    housing,
    breakfast,
    lunch,
    supper,
    drinks,
    entertainment,
    somethingElse,
    others
} ExpenseCategory;

typedef enum : NSUInteger {
    creditCard,
    cash,
    ezCard,
    iCash,
    iPass,
    other
} PaymentMode;

@interface Record : NSObject
@property (nonatomic, strong, readwrite) NSDate * date;
@property (nonatomic, assign, readwrite) ExpenseCategory expCategory;
@property (nonatomic, strong, readwrite) NSString * store;
@property (nonatomic, strong, readwrite) NSNumber * dollarAmount;
@property (nonatomic, strong, readwrite) NSString * explanation;
@property (nonatomic, assign, readwrite) PaymentMode paymentMode;
@property (nonatomic, assign, readwrite) BOOL shouldSplitTheBill;
@property (nonatomic, strong, readwrite) NSMutableArray <Person *> * billSplitPayers;
@property (nonatomic, strong, readwrite) Person * billPayer;
@property (nonatomic, assign, readwrite) BOOL isBillSplit;
@property (nonatomic, strong, readwrite) NSDate * createdDate;
@property (nonatomic, strong, readwrite) NSDate * updatedDate;
@property (nonatomic, assign, readwrite) NSString * identifier;

-(instancetype) initWithDictionary: (NSDictionary *) dictionary;
-(ExpenseCategory) expCategoryfromString:(NSString *) string;
-(PaymentMode) paymentModefromString:(NSString *) string;


@end
