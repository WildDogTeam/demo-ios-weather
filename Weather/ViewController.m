//
//  ViewController.m
//  Weather
//
//  Created by IMacLi on 15/7/28.
//  Copyright (c) 2015年 IMacLi. All rights reserved.
//

#import "ViewController.h"
#import <Wilddog/Wilddog.h>
@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *labelCondition;
@property (strong, nonatomic) IBOutlet UIButton *buttonSunny;
@property (strong, nonatomic) IBOutlet UIButton *buttonFoggy;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Wilddog *wd = [[Wilddog alloc] initWithUrl: @"https://hongye.wilddogio.com/condition"];
    
    
    [wd observeEventType:WEventTypeValue withBlock:^(WDataSnapshot *snapshot) {
        
        if ([snapshot.value isKindOfClass:[NSString class]]) {
            self.labelCondition.text = snapshot.value;
        }else {
            self.labelCondition.text = @"";
        }
        
        
    }];
}
- (IBAction)sendSunny:(UIButton *)sender {
    Wilddog *wd = [[Wilddog alloc] initWithUrl:@"https://hongye.wilddogio.com/condition"];
    [wd setValue:@"Sunny"];
}
- (IBAction)sendFoggy:(UIButton *)sender {
    Wilddog *wd = [[Wilddog alloc] initWithUrl:@"https://hongye.wilddogio.com/condition"];
    [wd setValue:@"Foggy"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
