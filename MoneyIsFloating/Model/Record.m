//
//  Record.m
//  MoneyIsFloating
//
//  Created by 典萱 高 on 2018/6/5.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import "Record.h"
static NSString *const keyIdentifier = @"key";
static NSString *const keyDate = @"date";
static NSString *const keyExpCategory = @"category";
static NSString *const keyDollarAmount = @"amount";
static NSString *const keyPaymentMode = @"payment_mode";
static NSString *const keyExplanation = @"explanation";
static NSString *const keyStore = @"store";
static NSString *const keyBillPayer = @"payer";
static NSString *const keyShouldSplitTheBill = @"should_split_bill";
static NSString *const keyBillSplitPayers = @"bill_split_payers";
static NSString *const keyCreatedDate = @"created_date";
static NSString *const keyIsBillSplit = @"is_bill_split";
static NSString *const keyUpdatedDate = @"updated_date";

@interface Record ()
@property (nonatomic, strong, readwrite) NSDate * createdDate;
@property (nonatomic, assign, readwrite) NSUInteger identifier;
@property (nonatomic, strong, readwrite) NSDate * updatedDate;

@end

@implementation Record
-(instancetype) initWithDictionary: (NSDictionary *) dictionary
{
    if(self = [super init]) {
#warning ToDo: dictionary to Record object
        if ([dictionary objectForKey:keyIdentifier]) {
            _identifier = (NSUInteger)[dictionary valueForKey:keyIdentifier];
        }
        if ([dictionary objectForKey:keyDate]) {
            NSString *date = [dictionary valueForKey:keyDate];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MM/dd"];
            NSDate *transformmedDate = [dateFormatter dateFromString:date];
            _date = transformmedDate;
        }
    }
    return self;
}

@end
