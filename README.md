# TimerHelper

* 一个倒计时工具类，使用dispatch_source_t 实现timer，实现了点击后出现倒计时功能。
* 当试图重新载入时，可延续原来的时间继续倒计时，可防止试图pop再push进去后，重复点击导致服务端短信重复发送。

# 效果

<img src="http://images.cnblogs.com/cnblogs_com/manji/735216/o_screenshot.gif" width="250"/>

# 使用方法

在UILabel的tap手势事件里启动timer：
```objc
- (void)sendCodeTouched:(id)sender {
    [TimerHelper startTimerWithKey:kTimerKeyRegister tipLabel:self.timerLabel];
    //TODO:一般都是调用服务端发送验证码接口，上面这行代码应该放到调用接口成功返回后再执行
}
```
在viewWillAppear里调用以自启动timer：
```objc
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //自动启动timer
    [TimerHelper timerCountDownWithKey:kTimerKeyRegister tipLabel:self.timerLabel forceStart:NO];
}
```
在viewDidDisappear里取消timer：
```objc
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    //取消timer
    [TimerHelper cancelTimerByKey:kTimerKeyRegister];
}
```
