# TXExplode
一行代码实现UIView的爆炸效果，对CAAnimationDelegate无覆盖

```
//UIView粉碎动画的开始和结束的协议
@protocol TXExplodeAnimDelegate <NSObject>
- (void)txExplodeAnimDidStart;
- (void)txExplodeAnimDidEnd;
@end
```

```
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
```


![image](https://github.com/luochaojing/TXExplode/blob/master/2.gif)



