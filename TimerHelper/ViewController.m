//
//  ViewController.m
//  TimerHelper
//
//  Created by develop on 15/9/15.
//
//

#import "ViewController.h"
#import "TimerHelper.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@end

@implementation ViewController

#pragma mark - LifeCircle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.timerLabel.layer.cornerRadius = 5.0;
    self.timerLabel.layer.masksToBounds = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sendCodeTouched:)];
    [self.timerLabel addGestureRecognizer:tap];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //自动启动timer
    [TimerHelper timerCountDownWithKey:kTimerKeyRegister tipLabel:self.timerLabel forceStart:NO];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    //取消timer
    [TimerHelper cancelTimerByKey:kTimerKeyRegister];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Method

- (void)sendCodeTouched:(id)sender {
    [TimerHelper startTimerWithKey:kTimerKeyRegister tipLabel:self.timerLabel];
    //TODO:一般都是调用服务端发送验证码接口，上面这行代码应该放到调用接口成功返回后再执行
}

@end
