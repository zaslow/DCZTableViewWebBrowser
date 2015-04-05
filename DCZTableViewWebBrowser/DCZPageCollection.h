//
//  DCZPageCollection.h
//  DCZTableViewWebBrowser
//
//  Created by Christine Gornall on 4/5/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DCZDataModel;

@interface DCZPageCollection : NSObject

@property (nonatomic, readonly) NSArray *allPages;

+ (instancetype)sharedPages;

- (DCZDataModel *)createPage;

@end
