//
//  MyTextContainer.m
//  VerticalTextDemo
//
//  Created by yuanrl on 15/4/2.
//  Copyright (c) 2015年 袁睿羚. All rights reserved.
//

#import "MyTextContainer.h"

@implementation MyTextContainer

- (CGRect)lineFragmentRectForProposedRect:(CGRect)proposedRect atIndex:(NSUInteger)characterIndex writingDirection:(NSWritingDirection)baseWritingDirection remainingRect:(CGRect *)remainingRect
{
    CGRect rect = [super lineFragmentRectForProposedRect:proposedRect atIndex:characterIndex writingDirection:baseWritingDirection remainingRect:remainingRect];
    if (self.type == 0) {
        return rect;
    }
    CGFloat textViewWidth = self.fromTextView.bounds.size.width;
    CGFloat textViewHeight = self.fromTextView.bounds.size.height;
    CGFloat charWidth = self.fromTextView.font.lineHeight;
    NSInteger charNumPerLine = textViewHeight/charWidth-1;
    if (charNumPerLine == 0) {
        charNumPerLine = 1;
    }

    CGRect newRect = CGRectMake(textViewWidth-(characterIndex/charNumPerLine+1)*charWidth-2, charWidth*(characterIndex%charNumPerLine), charWidth, charWidth);
    if (newRect.origin.y>charNumPerLine*charWidth) {
        newRect = CGRectMake(textViewWidth-(characterIndex/charNumPerLine+1)*charWidth-2, 0, charWidth, charWidth);
    }
    return newRect;
}

@end
