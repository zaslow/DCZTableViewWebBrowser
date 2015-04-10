//
//  DCZDataModel.m
//  DCZTableViewWebBrowser
//
//  Created by Christine Gornall on 4/5/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import "DCZDataModel.h"

@interface DCZDataModel ()

@end

@implementation DCZDataModel

+ (instancetype)sharedPages {
    static DCZDataModel *sharedPages = nil;
    
    // Do I need to create a sharedPages?
    if (!sharedPages) {
        sharedPages = [[self alloc] initPrivate];
    }
    return sharedPages;
}

// Here is the real (secret) initializer
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _URLs = [[NSMutableArray alloc] init];
        [_URLs addObject:@"http://www.github.com"];
        [_URLs addObject:@"http://www.linkedin.com"];
        [_URLs addObject:@"http://www.lynda.com"];
        [_URLs addObject:@"http://www.w3schools.com"];
        [_URLs addObject:@"http://www.wikipedia.org"];
        
        _pageNames = [[NSMutableArray alloc] init];
        [_pageNames addObject:@"GitHub"];
        [_pageNames addObject:@"LinkedIn"];
        [_pageNames addObject:@"Lynda.com"];
        [_pageNames addObject:@"W3Schools"];
        [_pageNames addObject:@"Wikipedia"];
    }
    return self;
}

/*
// If a programmer calls [[DCZDataModel alloc] init], let him know the error of his ways
- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[DCZDataModel sharedPages]"
                                 userInfo:nil];
    return nil;
}
*/
 
@end
