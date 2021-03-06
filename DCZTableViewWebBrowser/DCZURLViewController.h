//
//  DCZURLViewController.h
//  DCZTableViewWebBrowser
//
//  Created by Christine Gornall on 4/5/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCZURLViewController : UIViewController <NSURLConnectionDelegate>

@property (nonatomic) NSMutableString *currentPage;
@property (nonatomic, weak) IBOutlet UIWebView *urlPage;

@end
