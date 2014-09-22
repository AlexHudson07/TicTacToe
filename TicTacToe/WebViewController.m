//
//  WebViewController.m
//  TicTacToe
//
//  Created by Alex Hudson on 9/21/14.
//  Copyright (c) 2014 Alex Hudson. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString * urlString = @"http://en.wikipedia.org/wiki/Tic-tac-toe";
    NSURL * url = [NSURL URLWithString:urlString];

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];

    [self.webView loadRequest: urlRequest];

}

@end
