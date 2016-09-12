//
//  ViewController.m
//  Weather
//
//  Created by IMacLi on 15/7/28.
//  Copyright (c) 2015年 IMacLi. All rights reserved.
//

#import "ViewController.h"
#import "Wilddog.h"
@interface ViewController ()
{
    WDGSyncReference *ref;
}
@property (strong, nonatomic) IBOutlet UILabel *labelCondition;
@property (strong, nonatomic) IBOutlet UIButton *buttonSunny;
@property (strong, nonatomic) IBOutlet UIButton *buttonFoggy;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //初始化 WDGApp
    WDGOptions *option = [[WDGOptions alloc] initWithSyncURL:@"https://wild-weather.wilddogio.com/"];
    [WDGApp configureWithOptions:option];
    //获取一个指向根节点的 WDGSyncReference 实例
    WDGSyncReference *myRootRef = [[WDGSync sync] reference];
    
    ref = [myRootRef child:@"condition"];
    [ref observeEventType:WDGDataEventTypeValue withBlock:^(WDGDataSnapshot *snapshot) {
        if ([snapshot.value isKindOfClass:[NSString class]]) {
            self.labelCondition.text = snapshot.value;
        }else {
            self.labelCondition.text = @"";
        }
    }];
}
- (IBAction)sendSunny:(UIButton *)sender {
    [ref setValue:@"Sunny"];
}
- (IBAction)sendFoggy:(UIButton *)sender {
    [ref setValue:@"Foggy"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
