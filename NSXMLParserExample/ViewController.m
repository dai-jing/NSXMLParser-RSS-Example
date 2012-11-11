//
//  ViewController.m
//  NSXMLParserExample
//
//  Created by Kobe Dai on 11/11/12.
//  Copyright (c) 2012 Kobe Dai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableData *theData;
    NSString *currentKey;
    NSMutableString *currentValue;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableViewController = [[TableViewController alloc] initWithNibName: @"TableViewController" bundle: nil];
    
    self.linksArray = [[NSMutableArray alloc] init];
    self.titlesArray = [[NSMutableArray alloc] init];
    self.datesArray = [[NSMutableArray alloc] init];
    
    NSURL *theURL = [NSURL URLWithString: @"http://api.usatoday.com/open/articles/mobile/topnews/tech?api_key=rjpzbnm2cxbbk7b2xs29wg3t"];
    // Set the request
    NSURLRequest *theRequest = [[NSURLRequest alloc] initWithURL: theURL];
    // Set the connection
    NSURLConnection *theConnection = [NSURLConnection connectionWithRequest: theRequest delegate: self];
    if (theConnection)
    {
        theData = [NSMutableData data];
    }
    else
    {
        NSLog(@"Connection Failed");
    }
}

- (IBAction)loadTableView:(id)sender
{
    self.tableViewController.linksArray = self.linksArray;
    self.tableViewController.titlesArray = self.titlesArray;
    self.tableViewController.datesArray = self.datesArray;
    
    NSLog(@"%d", [self.tableViewController.linksArray count]);
    
    [self.navigationController pushViewController: self.tableViewController animated: YES];
}

#pragma mark NSURLConnectionData Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [theData setLength: 0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [theData appendData: data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection Failed");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Start parsing data with received data.
    [self startParsingData];
}

- (void)startParsingData
{
    // Initialize XML Parser.
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData: theData];
    parser.delegate = self;
    NSLog(@"%d", [parser parse]);
}

#pragma mark NSXMLParser Delegate Methods

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString: @"link"])
    {
        currentKey = @"link";
    }
    else if ([elementName isEqualToString: @"title"])
    {
        currentKey = @"title";
    }
    else if ([elementName isEqualToString: @"pubDate"])
    {
        currentKey = @"pubDate";
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (currentKey)
    {
        if ([currentKey isEqualToString: @"link"])
        {
            currentValue = [[NSMutableString alloc] initWithCapacity: 100];
            [currentValue appendString: string];
        }
        else if ([currentKey isEqualToString: @"title"])
        {
            currentValue = [[NSMutableString alloc] initWithCapacity: 100];
            [currentValue appendString: string];
        }
        else if ([currentKey isEqualToString: @"pubDate"])
        {
            currentValue = [[NSMutableString alloc] initWithCapacity: 100];
            [currentValue appendString: string];
        }
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString: @"link"])
    {
        [self.linksArray addObject: currentValue];
        currentValue = nil;
    }
    else if ([elementName isEqualToString: @"title"])
    {
        [self.titlesArray addObject: currentValue];
        currentValue = nil;
    }
    else if ([elementName isEqualToString: @"pubDate"])
    {
        [self.datesArray addObject: currentValue];
        currentValue = nil;
    }
    else if ([elementName isEqualToString: @"rss"])
    {
        // [self presentViewController: self.newsContentViewController animated: YES completion: nil];
        // parse ended.
    }
    [self.tableViewController.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
