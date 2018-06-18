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

@implementation Record
-(instancetype) initWithDictionary: (NSDictionary *) dictionary
{
    if(self = [super init]) {
#warning ToDo: dictionary to Record object
        _identifier = [dictionary objectForKey:keyIdentifier] ? : @"";

        if ([dictionary objectForKey:keyDate]) {
            NSString *date = [dictionary objectForKey:keyDate];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MM/dd"];
            NSDate *transformmedDate = [dateFormatter dateFromString:date];
            _date = transformmedDate;
        }
    }
    return self;
}

-(ExpenseCategory) expCategoryfromString:(NSString *) string
{
    if ([string isEqualToString:@"住宿"]) {
        return housing;
    } else if([string isEqualToString:@"交通"]) {
        return transportation;
    } else if ([string isEqualToString:@"娛樂"]) {
        return entertainment;
    } else if ([string isEqualToString:@"早餐"]) {
        return breakfast;
    } else if ([string isEqualToString:@"午餐"]) {
        return lunch;
    } else if ([string isEqualToString:@"晚餐"]) {
        return supper;
    } else if ([string isEqualToString:@"飲料"]) {
        return drinks;
    } else if ([string isEqualToString:@"亂亂買"]) {
        return somethingElse;
    } else {
        return others;
    }
}

-(PaymentMode) paymentModefromString:(NSString *) string
{
    if ([string isEqualToString:@"刷卡"] || [string isEqualToString:@"信用卡"]) {
        return creditCard;
    } else if([string isEqualToString:@"現金"]) {
        return cash;
    } else if ([string isEqualToString:@"悠遊卡"]) {
        return ezCard;
    } else if ([string isEqualToString:@"iCash"] ||[string isEqualToString:@"icash"] ||[string isEqualToString:@"i-cash"]) {
        return iCash;
    } else if ([string isEqualToString:@"一卡通"]) {
        return iPass;
    } else {
        return other;
    }
}


@end
