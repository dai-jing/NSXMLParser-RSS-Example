//
//  TableViewController.m
//  NSXMLParserExample
//
//  Created by Kobe Dai on 11/11/12.
//  Copyright (c) 2012 Kobe Dai. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView setBackgroundColor: [UIColor colorWithPatternImage: [UIImage imageNamed: @"ipadBGPattern"]]];
    
    self.title = @"Latest Tech News";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewData Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.datesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: CellIdentifier];
    }
    
    cell.textLabel.text = [self.titlesArray objectAtIndex: [indexPath row] + 2];
    cell.detailTextLabel.text = [self.datesArray objectAtIndex: [indexPath row]];
    
    return cell;
}

#pragma mark UITableViewDelegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.webViewController = [[WebViewController alloc] initWithNibName: @"WebViewController" bundle: nil];
    NSString *urlString = [self.linksArray objectAtIndex: [indexPath row]+2];
    NSURL *url = [NSURL URLWithString: urlString];
    self.webViewController.bURL = url;
    
    [self.navigationController pushViewController: self.webViewController animated: YES];
}

@end
