//
//  PRFGCDTimer.h
//  KuCar
//
//  Created by 庞日富 on 2019/8/8.
//  Copyright © 2019 庞日富. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RFBlock)(void);


@interface PRFGCDTimer : NSObject


/** 是否正在执行重复时间中 */
@property (nonatomic, assign) BOOL isRunning;


/** 持有block */
@property (nonatomic, copy) RFBlock block;

/** 记录传入来的时间 */
@property (nonatomic, assign) double time;



/**

 创建重复时间

 参数1:time 重复的间隔时间

 参数2:action block 传入需要执行的重复时间

 */
-(void)creatTimerWithTime:(double)time action:(void (^) (void))action;

/** 暂停 重复时间*/
-(void)stopAction;

/**重新开始重复时间*/
-(void)reStartAction;

@end

NS_ASSUME_NONNULL_END
