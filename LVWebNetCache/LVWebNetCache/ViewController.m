//
//  ViewController.m
//  LVWebNetCache
//
//  Created by apple on 17/3/8.
//  Copyright © 2017年 吕陈强. All rights reserved.
//

#import "ViewController.h"
#import "LVCacheUrlProtocol.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //使用方法，在开启webview的时候开启监听，，销毁weibview的时候取消监听，否则监听还在继续。将会监听所有的网络请求
    [LVCacheUrlProtocol startListeningNetWorking];
    UIWebView *webview = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webview];
    NSURL *URL = [NSURL URLWithString:@"https://m.jd.com"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:URL];
    [webview loadRequest:request];
    
    NSLog(@"cache directory---%@", NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]);

}
- (void)dealloc{
    [LVCacheUrlProtocol cancelListeningNetWorking];//在不需要用到webview的时候即使的取消监听
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
