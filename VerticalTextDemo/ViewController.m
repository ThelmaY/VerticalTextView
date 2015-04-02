//
//  ViewController.m
//  VerticalTextDemo
//
//  Created by yuanrl on 15/4/2.
//  Copyright (c) 2015年 袁睿羚. All rights reserved.
//

#import "ViewController.h"
#import "MyTextContainer.h"
@interface ViewController ()
{
    NSInteger currentType;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    currentType = 0;
    MyTextContainer *textContainer = [[MyTextContainer alloc]init];
    textContainer.widthTracksTextView = YES;
    textContainer.heightTracksTextView = NO;
    NSLayoutManager *layoutM = [[NSLayoutManager alloc]init];
    [layoutM addTextContainer:textContainer];
    NSTextStorage *textStorage = [[NSTextStorage alloc]init];
    [textStorage addLayoutManager:layoutM];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(16, 24, 288, 200) textContainer:textContainer];
    textView.tag = 101;
    textView.text = @"上善若水 I do not know how to translate";
    textView.font = [UIFont systemFontOfSize:15] ;
    textView.scrollEnabled = NO;
    [textView becomeFirstResponder];
    [self.view addSubview:textView];
    
    textContainer.fromTextView = textView;

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"changeType" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(110, 250, 100, 40);
    [self.view addSubview:button];
}

- (void)changeType:(id)sender
{
    NSLog(@"1");
    UITextView *textView = (id)[self.view viewWithTag:101];
    NSString *currentStr = textView.text;
    if (currentType == 0) {
        textView.textContainer.layoutOrientation = NSTextLayoutOrientationVertical;
        ((MyTextContainer *)textView.textContainer).type = 1;
        textView.text = [NSString stringWithFormat:@"%@ ",currentStr];
        currentType = 1;
    }else{
        textView.textContainer.layoutOrientation = NSTextLayoutOrientationHorizontal;
        ((MyTextContainer *)textView.textContainer).type = 0;
        textView.text = [NSString stringWithFormat:@"%@ ",currentStr];
        currentType = 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
