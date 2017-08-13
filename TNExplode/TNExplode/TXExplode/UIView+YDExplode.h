//
//  UIView+YDExplode.h
//  SportsBar
//
//  Created by Luo on 2017/8/10.
//  Copyright © 2017年 yuedong. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol TXExplodeAnimDelegate <NSObject>

- (void)txExplodeAnimDidStart;
- (void)txExplodeAnimDidEnd;

@end


@interface UIView (YDExplode)


/**
 TXExplodeAnimDelegate
 */
@property (weak, nonatomic) id<TXExplodeAnimDelegate> txExDelegate;


/**
 图片粉碎效果

 @param partNum partNum块
 */
- (void)explodeWithPartsNum:(NSInteger)partNum;


@end
