//
//  NTInformationWebViewViewController.m
//  NTConnotation
//
//  Created by Nineteen on 8/12/16.
//  Copyright © 2016 nineteen. All rights reserved.
//

#import "NTInformationWebViewViewController.h"

@interface NTInformationWebViewViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation NTInformationWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.URL]]];
}

@end
