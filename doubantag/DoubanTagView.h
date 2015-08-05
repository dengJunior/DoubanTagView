//
//  DoubanTagView.h
//  doubantag
//
//  Created by Bobo Shone on 15/8/5.
//
//

#import <UIKit/UIKit.h>

@interface DoubanTagView : UIView

- (void)setTags:(NSArray *)tags
     tapHandler:(void (^)(NSInteger tagIndex))tapHandler;

@end
