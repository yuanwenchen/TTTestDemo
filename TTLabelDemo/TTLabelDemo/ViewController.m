//
//  ViewController.m
//  TTLabelDemo
//
//  Created by 袁文辰 on 2018/5/14.
//  Copyright © 2018年 袁文辰. All rights reserved.
//

#import "ViewController.h"

#import "TTFeedbackViewController.h"

#import <YYText/YYText.h>

@interface ViewController ()

@property (nonatomic , weak) IBOutlet YYLabel * feedbackLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    YYTextHighlight *highlight = [YYTextHighlight new];
    [highlight setColor:[UIColor blueColor]];
    __weak typeof(self) weakSelf = self;
    highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        [weakSelf pushFeedBack];
    };
    
    NSMutableAttributedString *feedbackstr = [[NSMutableAttributedString alloc] initWithString:@"欢迎使用探探, 在使用过程中有疑问请 反馈 "];
    NSRange range = NSMakeRange(18, 4);
    feedbackstr.yy_font = [UIFont systemFontOfSize:14];
    [feedbackstr yy_setFont:[UIFont boldSystemFontOfSize:14] range:range];
    feedbackstr.yy_color = [UIColor blackColor];
    feedbackstr.yy_underlineColor = [UIColor blackColor];
    [feedbackstr yy_setUnderlineStyle:NSUnderlineStyleSingle range:range];
    [feedbackstr yy_setTextHighlight:highlight range:range];
    self.feedbackLabel.attributedText = feedbackstr;
    self.feedbackLabel.textAlignment = NSTextAlignmentCenter;
    self.feedbackLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    
}

- (void)pushFeedBack{
//    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tantanapp://feedback"]]) {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tantanapp://feedback"] options:@{} completionHandler:^(BOOL success) {
//            //
//        }];
//    }
    
    TTFeedbackViewController * fbvc = [[TTFeedbackViewController alloc] init];
    [self.navigationController pushViewController:fbvc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
