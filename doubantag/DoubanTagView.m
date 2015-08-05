//
//  DoubanTagView.m
//  doubantag
//
//  Created by Bobo Shone on 15/8/5.
//
//

#import "DoubanTagView.h"

@interface DoubanTagView ()

@property (nonatomic, copy) void (^tapHandler)(NSInteger tagIndex);

@end

@implementation DoubanTagView

- (void)setTags:(NSArray *)tags tapHandler:(void (^)(NSInteger tagIndex))tapHandler {
    self.tapHandler = tapHandler;
    
    CGFloat margin = 15.f;
    CGFloat buttonOffsetX = 10.f;
    CGFloat buttonOffsetY = 10.f;
    CGFloat labelInsetX = 10.f;
    CGFloat labelInsetY = 4.f;
    CGFloat buttonX = margin;
    CGFloat buttonY = margin;
    for (int i = 0; i != tags.count; i++) {
        NSString *tag = [tags objectAtIndex:i];
        
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor blackColor];
        label.text = tag;
        [label sizeToFit];
        
        CGFloat buttonWidth = label.frame.size.width + labelInsetX*2;
        CGFloat buttonHeight = label.frame.size.height + labelInsetY*2;
        if (buttonX + buttonWidth > self.frame.size.width - margin) {
            buttonX = margin;
            buttonY += buttonHeight + buttonOffsetY;
            
            if (buttonY > self.frame.size.height - margin - buttonHeight) {
                NSLog(@"warning -> view frame is small");
            }
        }
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        button.layer.borderWidth = 1.f / [UIScreen mainScreen].scale;
        button.layer.cornerRadius = buttonHeight/2;
        button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
        [self addSubview:button];
        button.tag = i;
        [button addTarget:self
                   action:@selector(handleTap:)
         forControlEvents:UIControlEventTouchUpInside];
        
        label.center = button.center;
        [self addSubview:label];
        
        buttonX += buttonWidth + buttonOffsetX;
    }
}

- (void)handleTap:(id)sender {
    if (self.tapHandler) {
        NSInteger index = [sender tag];
        self.tapHandler(index);
    }
}

@end
