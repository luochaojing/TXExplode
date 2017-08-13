//
//  ViewController.m
//  TNExplode
//
//  Created by Luo on 2017/8/11.
//  Copyright © 2017年 yuedongquan. All rights reserved.
//

#import "ViewController.h"
#import "UIView+YDExplode.h"
#import "TXImageView.h"

#define SCREEN_WID [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEI [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<TXExplodeAnimDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) TXImageView *imgV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];


    _imgV = [[TXImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WID - 30, SCREEN_WID - 30)];
    _imgV.center = CGPointMake(SCREEN_WID / 2, SCREEN_HEI / 2);
    _imgV.contentMode = UIViewContentModeScaleToFill;
    _imgV.image = [UIImage imageNamed:@"xiannv.png"];
    _imgV.txExDelegate = self;
    _imgV.backgroundColor = [UIColor redColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgTapEvent:)];
    tap.delegate = self;
    tap.numberOfTapsRequired = 1; // 单击

    //[_imgV addGestureRecognizer:tap];
    
    [self.view addGestureRecognizer:tap];
    [self.view addSubview:_imgV];
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"开始时间");
        [_imgV explodeWithPartsNum:10];
    });
    
    
}


- (void)txExplodeAnimDidStart
{
    static NSInteger index = 1;
    NSString *iconName = [NSString stringWithFormat:@"%ld.png", index];
    _imgV.image = [UIImage imageNamed:iconName];
    index++;
    if (index > 3) {
        index = 1;
    }
}

- (void)txExplodeAnimDidEnd
{
    NSLog(@"完全碎了");
    //_imgV.image = [UIImage imageNamed:@"xiannv.png"];
    
    //[_imgV explodeWithPartsNum:10];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - imgTapEvent

- (void)imgTapEvent:(UIGestureRecognizer *)tap
{
    [_imgV explodeWithPartsNum:10];
}




@end
