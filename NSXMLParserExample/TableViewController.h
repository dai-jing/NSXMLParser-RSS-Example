//
//  TableViewController.h
//  NSXMLParserExample
//
//  Created by Kobe Dai on 11/11/12.
//  Copyright (c) 2012 Kobe Dai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"

@interface TableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) WebViewController *webViewController;

@property (retain, nonatomic) NSMutableArray *linksArray;
@property (retain, nonatomic) NSMutableArray *titlesArray;
@property (retain, nonatomic) NSMutableArray *datesArray;

@end
