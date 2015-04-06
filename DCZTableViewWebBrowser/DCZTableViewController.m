//
//  ViewController.m
//  DCZTableViewWebBrowser
//
//  Created by Christine Gornall on 4/5/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import "DCZTableViewController.h"
#import "DCZPageCollection.h"
#import "DCZDataModel.h"

@interface DCZTableViewController ()

@end

@implementation DCZTableViewController

- (instancetype)init {
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        DCZDataModel *Wikipedia = [[DCZDataModel alloc] init];
            Wikipedia.URL = @"http://www.wikipedia.org";
            Wikipedia.pageName = @"Wikipedia";
        DCZDataModel *Lynda = [[DCZDataModel alloc] init];
            Lynda.URL = @"http://www.lynda.com";
            Lynda.pageName = @"Lynda.com";
        DCZDataModel *LinkedIn = [[DCZDataModel alloc] init];
            LinkedIn.URL = @"http://www.linkedin.com";
            LinkedIn.pageName = @"LinkedIn";
        DCZDataModel *GitHub = [[DCZDataModel alloc] init];
            GitHub.URL = @"http://www.github.com";
            GitHub.pageName = @"GitHub";
        DCZDataModel *W3Schools = [[DCZDataModel alloc] init];
            W3Schools.URL = @"http://www.w3schools.com";
            W3Schools.pageName = @"W3 Schools";
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [[[DCZPageCollection sharedPages] allPages] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Create an instance of UITableViewCell, with default appearance
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:@"UITableViewCell"];
    
    // Set the text on the cell with the description of the item that is at the nth index of items,
    // where n = row this cell will appear in on the tableview
    NSArray *pages = [[DCZPageCollection sharedPages] allPages];
    DCZDataModel *page = pages[indexPath.row];
    cell.textLabel.text = [page description];
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
