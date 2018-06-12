//
//  ViewController.m
//  MoneyIsFloating
//
//  Created by 典萱 高 on 2018/6/5.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import "ViewController.h"
#import "SheetDBSDK.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[SheetDBSDK sharedInstance] fetchAllDataWithCallback:^(NSArray <NSDictionary *>* dictionaries, NSError * error) {
        NSLog(@"sheetDBSDK get all data called");
        NSLog(@"%@", [NSString stringWithFormat:@"dic is %@", dictionaries]);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
