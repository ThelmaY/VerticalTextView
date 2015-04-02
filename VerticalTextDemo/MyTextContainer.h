//
//  MyTextContainer.h
//  VerticalTextDemo
//
//  Created by yuanrl on 15/4/2.
//  Copyright (c) 2015年 袁睿羚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTextContainer : NSTextContainer

@property (nonatomic)NSInteger type;//0 == horizontal, 1 == vertical
@property (nonatomic,weak)UITextView *fromTextView;

@end
