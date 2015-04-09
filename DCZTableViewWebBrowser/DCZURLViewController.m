//
//  DCZURLViewController.m
//  DCZTableViewWebBrowser
//
//  Created by Christine Gornall on 4/5/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import "DCZURLViewController.h"
#import "DCZTableViewController.h"

@interface DCZURLViewController ()

@end

@implementation DCZURLViewController

- (instancetype)initWithNibName:(NSString *)nibNameorNil
                         bundle:(NSBundle *)nibBundleOrNil {
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameorNil bundle:nibBundleOrNil];
    
    // Return the address of the new object;
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear: (BOOL)animated {
    [super viewWillAppear:animated];
    
    NSMutableString *currentPage = self.currentPage;
    self.navigationItem.title = currentPage;
    
    NSURL *URL = [NSURL URLWithString:currentPage];
    NSURLRequest *req = [NSURLRequest requestWithURL:URL];
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:req
                                                          delegate:self];
    
    if(conn!=nil) {
        [conn start];
    }
    
    [_urlPage loadRequest:req];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //Clear first responder
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
*/

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [error localizedDescription];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
}

@end
