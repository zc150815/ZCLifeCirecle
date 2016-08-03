//
//  LSJProductInfoViewController.m
//  LifeCircle
//
//  Created by Ning Xie on 16/8/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJProductInfoViewController.h"

@interface LSJProductInfoViewController ()

@end

@implementation LSJProductInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *webView = [[UIWebView alloc]init];
    
    [self.view addSubview:webView];
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(self.view);
        
    }];
    
//    [webView loadHTMLString:self.urlStr baseURL:nil];
    [webView  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];

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


@end
