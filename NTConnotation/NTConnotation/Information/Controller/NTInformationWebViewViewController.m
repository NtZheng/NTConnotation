//
//  NTInformationWebViewViewController.m
//  NTConnotation
//
//  Created by Nineteen on 8/12/16.
//  Copyright © 2016 nineteen. All rights reserved.
//

#import "NTInformationWebViewViewController.h"

@interface NTInformationWebViewViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backBarButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardBarButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshBarButtonItem;

@end

@implementation NTInformationWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.URL]]];
}

- (IBAction)backAction:(id)sender {
    [self.webView goBack];
}

- (IBAction)forwardAction:(id)sender {
    [self.webView goForward];
}

- (IBAction)refreshAction:(id)sender {
    [self.webView reload];
}

#pragma mark - delegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.backBarButtonItem.enabled = self.webView.canGoBack;
    self.forwardBarButtonItem.enabled = self.webView.canGoForward;
}

@end
