//
//  WebViewController.m
//  NSXMLParserExample
//
//  Created by Kobe Dai on 11/11/12.
//  Copyright (c) 2012 Kobe Dai. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

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
    self.title = @"USA Today News";
    // Do any additional setup after loading the view from its nib.
    
    NSURLRequest *request = [NSURLRequest requestWithURL: self.bURL];
    [self.webView loadRequest: request];
}

// Only load the news content to the UIWebView which does not work on my simulator. Should be tested using device.

//- (void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    NSLog(@"Web View Did Finish Load");
//    if (self.firstLoad && !self.secondLoad)
//    {
//        NSString *title = [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementsByTagName('h1')[0].innerHTML"];
//        NSString *author = [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementsByClassName('credits-wrap')[0].innerHTML"];
//        NSString *body = [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementsByClassName('double-wide')[0].innerHTML"];
//        NSString *html = [NSString stringWithFormat: @"<html> <head></head> <body><h1>%@</h1>%@%@</body></html>", title, author, body];
//        [self.webView loadHTMLString: html baseURL: nil];
//        self.firstLoad = NO;
//        self.secondLoad = YES;
//    }
//    else if (!self.firstLoad && self.secondLoad)
//    {
//        self.webView.hidden = NO;
//    }
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
