//
//  DCZDataModel.h
//  DCZTableViewWebBrowser
//
//  Created by Christine Gornall on 4/5/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCZDataModel : NSObject

@property (nonatomic) NSMutableArray *URLs;
@property (nonatomic) NSMutableArray *pageNames;

+ (instancetype) sharedPages;

@end
