//
//  Record.m
//  MoneyIsFloating
//
//  Created by 典萱 高 on 2018/6/5.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import "Record.h"
#import "Person.h"

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
        if ([[dictionary objectForKey:keyIdentifier] respondsToSelector:@selector(stringValue)]) {
            _identifier = [[dictionary objectForKey:keyIdentifier] stringValue];
        } else {
            _identifier = [NSString stringWithString:[dictionary objectForKey:keyIdentifier]];
        }

        NSMutableString *date = [dictionary objectForKey:keyDate];
        if (date && ![date isEqualToString:@""]) {
            _date = [self dateFromString:date mode:@"date"];
        } else {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy/MM/dd"];
            NSString *defaultDate = @"1900/01/01";
            _date = [dateFormatter dateFromString:defaultDate];
        }

        _store = [dictionary objectForKey:keyStore]? : @"";

        NSNumber *dollarAmount = [dictionary objectForKey:keyDollarAmount];
        _dollarAmount = dollarAmount;

        _explanation = [dictionary objectForKey:keyExplanation]? : @"";

        NSString *expCategoryString = [dictionary objectForKey:keyExpCategory]? :@"";
        ExpenseCategory category = [self expCategoryFromString:expCategoryString];
        _expCategory = category;

        NSString *paymentModeString = [dictionary objectForKey:keyPaymentMode];
        PaymentMode paymentMode = [self paymentModeFromString:paymentModeString];
        _paymentMode = paymentMode;

        NSString *shouldSplitTheBillString = [dictionary objectForKey:keyShouldSplitTheBill];
        _shouldSplitTheBill = [self shouldSplitTheBillFromString: shouldSplitTheBillString];

        NSString *isBillSplitString = [dictionary objectForKey:keyIsBillSplit];
        _isBillSplit = [self isBillSplitFromString: isBillSplitString];

        date = [dictionary objectForKey:keyCreatedDate];
        _createdDate = [self dateFromString: date mode: @""];

        date = [dictionary objectForKey:keyUpdatedDate];
        _updatedDate = [self dateFromString: date mode: @""];

        NSString * billPayerName = [dictionary objectForKey:keyBillPayer];
        _billPayer = [self billPayerFromString: billPayerName];

        NSString * billSplitPayersString = [dictionary objectForKey:keyBillSplitPayers];
        _billSplitPayers = [self payersFromString: billSplitPayersString];

    }
    return self;
}

-(NSDate *) dateFromString: (NSString *) string mode: (NSString *) dateMode
{
    if ([dateMode isEqualToString:@"date"]) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM/dd"];
        NSDate *transformmedDate = [dateFormatter dateFromString:string];
        return transformmedDate;
    } else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
        NSDate *transformmedDate = [dateFormatter dateFromString:string];
        return transformmedDate;
    }
}

-(ExpenseCategory) expCategoryFromString:(NSString *) string
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

-(PaymentMode) paymentModeFromString:(NSString *) string
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

-(BOOL) shouldSplitTheBillFromString:(NSString *) string
{
    if ([string isEqualToString:@"是"] || [string isEqualToString:@"Yes"] ||[string isEqualToString:@"Y"] ||[string isEqualToString:@"yes"] ||[string isEqualToString:@"true"] || [string isEqualToString:@"TRUE"] || [string isEqualToString:@"True"]) {
        return YES;
    } else {
        return NO;
    }
}

-(BOOL) isBillSplitFromString:(NSString *) string
{
    if ([string isEqualToString:@"是"] || [string isEqualToString:@"Yes"] ||[string isEqualToString:@"Y"] ||[string isEqualToString:@"yes"] ||[string isEqualToString:@"true"] || [string isEqualToString:@"TRUE"] || [string isEqualToString:@"True"]) {
        return YES;
    } else {
        return NO;
    }
}

-(Person*) billPayerFromString: (NSString *) string
{
    Person *person = [[Person alloc] init];
    person.name = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return person;
}

-(NSMutableArray <Person *>*) payersFromString: (NSString *) string
{
    if (!string || [string isEqualToString:@""]) {
        return @[];
    } else {
        NSArray *names = [string componentsSeparatedByString:@","];
        NSMutableArray <Person *>* payers = [[NSMutableArray <Person*> alloc] init];
        for (NSString *name in names) {
            Person* payer = [self billPayerFromString:name];
            [payers addObject:payer];
        }
        return payers;
    }
}




@end
