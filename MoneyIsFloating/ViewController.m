//
//  ViewController.m
//  MoneyIsFloating
//
//  Created by 典萱 高 on 2018/6/5.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import "ViewController.h"
#import "SheetDBSDK.h"

#import "Person.h"
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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[SheetDBSDK sharedInstance] fetchAllDataWithCallback:^(NSArray <NSDictionary *>* dictionaries, NSError * error) {
        NSLog(@"sheetDBSDK get all data called");
        NSLog(@"%@", [NSString stringWithFormat:@"dic is %@", dictionaries]);

        for (NSDictionary *dic in dictionaries) {
            Record *record = [[Record alloc] initWithDictionary: dic];

            NSLog(@"identifier: %@", record.identifier);

            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MM/dd"];
            NSString * dateToShow = [dateFormatter stringFromDate:record.date];
            NSLog(@"date: %@", dateToShow);

            NSLog(@"store: %@", record.store);
            NSLog(@"dollar amount: %@", record.dollarAmount);
            NSLog(@"explanation: %@", record.explanation);

            switch (record.expCategory) {
                case transportation:
                    NSLog(@"expense category: %@", @"transportation");
                    break;
                case housing:
                    NSLog(@"expense category: %@", @"housing");
                    break;
                case breakfast:
                    NSLog(@"expense category: %@", @"breakfast");
                    break;
                case lunch:
                    NSLog(@"expense category: %@", @"lunch");
                    break;
                case supper:
                    NSLog(@"expense category: %@", @"supper");
                    break;
                case drinks:
                    NSLog(@"expense category: %@", @"drinks");
                    break;
                case entertainment:
                    NSLog(@"expense category: %@", @"entertainment");
                    break;
                case somethingElse:
                    NSLog(@"expense category: %@", @"somethingElse");
                    break;
                default:
                    NSLog(@"expense category: %@", @"others");
                    break;
            }

            switch (record.paymentMode) {
                case creditCard:
                    NSLog(@"expense category: %@", @"credit card");
                    break;
                case cash:
                    NSLog(@"expense category: %@", @"cash");
                    break;
                case ezCard:
                    NSLog(@"expense category: %@", @"ezCard");
                    break;
                case iCash:
                    NSLog(@"expense category: %@", @"icash");
                    break;
                case iPass:
                    NSLog(@"expense category: %@", @"iPass");
                    break;
                default:
                    NSLog(@"expense category: %@", @"other");
                    break;
            }

            if (record.shouldSplitTheBill) {
                NSLog(@"should split the Bill? YES");
            } else {
                NSLog(@"should split the Bill? NO");
            }

            if (record.isBillSplit) {
                NSLog(@"is Bill split? YES");
            } else {
                NSLog(@"is Bill split? NO");
            }

            [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
            NSString *createdDateToShow = [dateFormatter stringFromDate:record.createdDate];
            NSLog(@"created date: %@", createdDateToShow);

            NSString *updatedDateToShow = [dateFormatter stringFromDate:record.updatedDate];
            NSLog(@"updated date: %@", updatedDateToShow);

            NSLog(@"bill payer: %@", record.billPayer.name);

            if (!record.billSplitPayers || record.billSplitPayers.count != 0) {
                NSLog(@"%lu payers should pay", (unsigned long)record.billSplitPayers.count);
                for (Person * payer in record.billSplitPayers) {
                    NSLog(@"who should pay? %@", payer.name);
                }

            }


        }

//        for (NSDictionary * dic in dictionaries) {
//            Record * record = [[Record alloc]init];
//            record.identifier = [dic objectForKey:keyIdentifier];
//            NSLog(@"identifier: %@", record.identifier);
//
//            NSMutableString *dateString = [dic objectForKey:keyDate];
//            record.date = [record dateFromString: dateString mode: @"date"];
//
//            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//            [dateFormatter setDateFormat:@"MM/dd"];
//            NSString * dateToShow = [dateFormatter stringFromDate:record.date];
//            NSLog(@"date: %@", dateToShow);
//
//            NSString *store = [dic objectForKey:keyStore];
//            record.store = store;
//            NSLog(@"store: %@", record.store);
//
//            NSNumber *dollarAmount = [dic objectForKey:keyDollarAmount];
//            record.dollarAmount = dollarAmount;
//            NSLog(@"dollar amount: %@", dollarAmount);
//
//            NSString *explanation = [dic objectForKey:keyExplanation];
//            record.explanation = explanation;
//            NSLog(@"explanation: %@", explanation);
//
//            NSString *expCategoryString = [dic objectForKey:keyExpCategory];
//            ExpenseCategory category = [record expCategoryFromString:expCategoryString];
//            record.expCategory = category;
//            switch (record.expCategory) {
//                case transportation:
//                    NSLog(@"expense category: %@", @"transportation");
//                    break;
//                case housing:
//                    NSLog(@"expense category: %@", @"housing");
//                    break;
//                case breakfast:
//                    NSLog(@"expense category: %@", @"breakfast");
//                    break;
//                case lunch:
//                    NSLog(@"expense category: %@", @"lunch");
//                    break;
//                case supper:
//                    NSLog(@"expense category: %@", @"supper");
//                    break;
//                case drinks:
//                    NSLog(@"expense category: %@", @"drinks");
//                    break;
//                case entertainment:
//                    NSLog(@"expense category: %@", @"entertainment");
//                    break;
//                case somethingElse:
//                    NSLog(@"expense category: %@", @"somethingElse");
//                    break;
//                default:
//                    NSLog(@"expense category: %@", @"others");
//                    break;
//            }
//
//            NSString *paymentModeString = [dic objectForKey:keyPaymentMode];
//            PaymentMode paymentMode = [record paymentModeFromString:paymentModeString];
//            record.paymentMode = paymentMode;
//
//            switch (record.paymentMode) {
//                case creditCard:
//                    NSLog(@"expense category: %@", @"credit card");
//                    break;
//                case cash:
//                    NSLog(@"expense category: %@", @"cash");
//                    break;
//                case ezCard:
//                    NSLog(@"expense category: %@", @"ezCard");
//                    break;
//                case iCash:
//                    NSLog(@"expense category: %@", @"icash");
//                    break;
//                case iPass:
//                    NSLog(@"expense category: %@", @"iPass");
//                    break;
//                default:
//                    NSLog(@"expense category: %@", @"other");
//                    break;
//            }
//
//            NSString *shouldSplitTheBillString = [dic objectForKey:keyShouldSplitTheBill];
//            record.shouldSplitTheBill = [record shouldSplitTheBillFromString: shouldSplitTheBillString];
//            if (record.shouldSplitTheBill) {
//                NSLog(@"should split the Bill? YES");
//            } else {
//                NSLog(@"should split the Bill? NO");
//            }
//
//            NSString *isBillSplitString = [dic objectForKey:keyIsBillSplit];
//            record.isBillSplit = [record isBillSplitFromString: isBillSplitString];
//            if (record.isBillSplit) {
//                NSLog(@"is Bill split? YES");
//            } else {
//                NSLog(@"is Bill split? NO");
//            }
//
//            dateString = [dic objectForKey:keyCreatedDate];
//            record.createdDate = [record dateFromString: dateString mode: @""];
//
//            dateFormatter = [[NSDateFormatter alloc] init];
//            [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
//            NSString *createdDateToShow = [dateFormatter stringFromDate:record.createdDate];
//            NSLog(@"created date: %@", createdDateToShow);
//
//            dateString = [dic objectForKey:keyUpdatedDate];
//            record.updatedDate = [record dateFromString: dateString mode: @""];
//
//            dateFormatter = [[NSDateFormatter alloc] init];
//            [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"];
//            NSString *updatedDateToShow = [dateFormatter stringFromDate:record.updatedDate];
//            NSLog(@"updated date: %@", updatedDateToShow);
//
//            NSString * billPayerName = [dic objectForKey:keyBillPayer];
//            record.billPayer = [record billPayerFromString: billPayerName];
//            NSLog(@"bill payer: %@", record.billPayer.name);
//
//            NSString * billSplitPayersString = [dic objectForKey:keyBillSplitPayers];
//            record.billSplitPayers = [record payersFromString: billSplitPayersString];
//            if (!record.billSplitPayers || record.billSplitPayers.count != 0) {
//                NSLog(@"%lu payers should pay", (unsigned long)record.billSplitPayers.count);
//                for (Person * payer in record.billSplitPayers) {
//                    NSLog(@"who should pay? %@", payer.name);
//                }
//
//            }
//
//        }


    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
