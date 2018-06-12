//
//  SheetDBSDK.m
//  MoneyIsFloating
//
//  Created by 典萱 高 on 2018/6/12.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import "SheetDBSDK.h"

static NSString *const sheetDBAPI = @"https://sheetdb.io/api/v1/5b1e44ce466b9";
static NSString *const endPointGetKeys = @"/keys";
static NSString *const endPointGetDocumentName = @"/name";
static NSString *const endPointGetListOfAvailableSheets = @"/sheets";
static NSString *const endPointGetRowCount = @"/count";

@interface SheetDBSDK ()
@property (strong, nonatomic) NSURLSession * session;
@property (strong, nonatomic) NSMutableArray <NSURLSessionDataTask *>* dataTasks;
@end

@implementation SheetDBSDK

#pragma singleton
+(instancetype) sharedInstance
{
    static SheetDBSDK * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SheetDBSDK alloc] init];
    });
    return instance;
}

#pragma lazy properties
-(NSURLSession *) session
{
    if (!_session) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//        configuration.timeoutIntervalForRequest = 60;
//        configuration.timeoutIntervalForResource = 60;
        _session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return _session;
}

-(NSMutableArray <NSURLSessionDataTask *> *) dataTasks
{
    if (!_dataTasks) {
        NSMutableArray *array = [NSMutableArray <NSURLSessionDataTask *> array];
        _dataTasks = array;
    }
    return _dataTasks;
}

#pragma GET methods

-(void) fetchAllDataWithCallback: (void(^)(NSArray <NSDictionary *> *, NSError *)) callback
{
    NSURL *getAllDataURL = [NSURL URLWithString:sheetDBAPI];
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:getAllDataURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"in completion handler");

        NSError * parseJSONError = nil;
        NSArray <NSDictionary *> * jsonRootObjects = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&parseJSONError];

        if (parseJSONError) {
            callback(nil, parseJSONError);
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            callback(jsonRootObjects, nil);
        });
    }];
    dataTask.taskDescription = [NSString stringWithFormat:@"get all data from sheetDB"];
    [self.dataTasks addObject:dataTask];
    [dataTask resume];
}

-(void) fetchKeysWithCallback: (void (^)(NSDictionary *, NSError *)) callback
{

}

-(void) fetchDocumentNameWithCallback: (void (^)(NSDictionary *, NSError *)) callback
{

}

-(void) fetchListOfAvailableSheetsWithCallback: (void (^)(NSDictionary *, NSError *)) callback
{

}

-(void) fetchRowCountsWithCallback: (void (^)(NSDictionary *, NSError *)) callback
{

}

-(void) searchWithParameters: (NSDictionary *) params caseSensitive: (BOOL) isCaseSensitive callback: (void (^)(NSDictionary *, NSError *)) callback
{

}

-(void) searchOrWithParameters: (NSDictionary *) params caseSensitive: (BOOL) isCaseSensitive callback: (void (^)(NSDictionary *, NSError *)) callback
{

}

@end
