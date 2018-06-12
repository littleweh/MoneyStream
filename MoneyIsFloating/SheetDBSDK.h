//
//  SheetDBSDK.h
//  MoneyIsFloating
//
//  Created by 典萱 高 on 2018/6/12.
//  Copyright © 2018年 LostRfounds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SheetDBSDK : NSObject
+(instancetype) sharedInstance;
-(void) fetchAllDataWithCallback: (void(^)(NSArray <NSDictionary *> *, NSError *)) callback;
-(void) fetchKeysWithCallback: (void (^)(NSDictionary *, NSError *)) callback;
-(void) fetchDocumentNameWithCallback: (void (^)(NSDictionary *, NSError *)) callback;
-(void) fetchListOfAvailableSheetsWithCallback: (void (^)(NSDictionary *, NSError *)) callback;
-(void) fetchRowCountsWithCallback: (void (^)(NSDictionary *, NSError *)) callback;
-(void) searchWithParameters: (NSDictionary *) params caseSensitive: (BOOL) isCaseSensitive callback: (void (^)(NSDictionary *, NSError *)) callback;
-(void) searchOrWithParameters: (NSDictionary *) params caseSensitive: (BOOL) isCaseSensitive callback: (void (^)(NSDictionary *, NSError *)) callback;
@end
