//
//  ViewController.m
//  MyTools
//
//  Created by 庞日富 on 2019/8/19.
//  Copyright © 2019 庞日富. All rights reserved.
//

#import "ViewController.h"
#import "RFBlockBtn.h"
#import "RFColorTool.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [RFColorTool colorWithHexString:@"f0769d" alpha:1];//f0769d
    
    RFBlockBtn *btn = [[RFBlockBtn alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:btn];
    [btn addTapBlock:^(UIButton * _Nonnull btn) {
        NSLog(@"btnClick~~~");
    }];
    btn.backgroundColor = [RFColorTool colorWithHexString:@"f4f4f4" alpha:1];
    
    
    
}


@end
