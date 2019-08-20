//
//  PRFGCDTimer.m
//  KuCar
//
//  Created by 庞日富 on 2019/8/8.
//  Copyright © 2019 庞日富. All rights reserved.
//

#import "PRFGCDTimer.h"


@interface PRFGCDTimer ()

/** 持有timer */
@property (strong, nonatomic) dispatch_source_t gcdTimer;


@end

@implementation PRFGCDTimer


-(instancetype)init{
    if (self = [super init]) {

    }
    return self;
}


/**

 创建重复时间

 参数1:time 重复的间隔时间

 参数2:action block 传入需要执行的重复时间

 */
-(void)creatTimerWithTime:(double)time action:(void (^) (void))action{

    if (!self.isRunning) {
        //持有block
        self.block = action;
        //持有时间
        self.time = time;

        //1.创建GCD定时器
        /**
         参数1:设定soucrce的类型: DISPATCH_SOURCE_TYPE_TIMER -> 定时器类型
         参数2:描述信息,线程id
         参数3:更详细的描述信息
         参数4:队列,决定了timer在执行任务的时候在什么线程中执行
         */
        self.gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_queue_create(0, 0));

        //2.设置定时器的其他参数
        /**
         参数1:对哪一个timer进行设置
         参数2:经过多少秒后启动
         参数3:执行任务的时间间隔
         参数4:误差度 传0表示决定精准
         */
        dispatch_source_set_timer(self.gcdTimer, DISPATCH_TIME_NOW, time * NSEC_PER_SEC, 0 * NSEC_PER_SEC);

        //3.为定时器添加需要还行的任务
        dispatch_source_set_event_handler(self.gcdTimer, action);


        //4.启动GCD定时器
        dispatch_resume(self.gcdTimer);


        //GCD的timer 不受 runloop的 mode影响,会一直执行
        //GCD的timer 是绝对精准的

        self.isRunning = YES;
    }
}



/** 暂停 重复时间*/
-(void)stopAction{

    NSLog(@"stopAction");

    if (self.isRunning) {
        dispatch_cancel(self.gcdTimer);
        self.isRunning = NO;
    }else{
        NSLog(@"当前没有执行循环事件");
    }
}

/**重新开始重复时间*/
-(void)reStartAction{
    //如果m
    if (!self.isRunning ) {
        [self creatTimerWithTime:self.time action:self.block];
    }
}
@end
