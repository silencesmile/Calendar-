//
//  ViewController.m
//  Calendar(日历)
//
//  Created by youngstar on 16/3/2.
//  Copyright © 2016年 杨铭星. All rights reserved.
//
#define kVRGCalendarViewDayHeight 40
// 屏幕尺寸
#define CWScreenW [UIScreen mainScreen].bounds.size.width

#import "ViewController.h"
#import "VRGCalendarView.h"

@interface ViewController () <VRGCalendarViewDelegate>

// 日历
@property(nonatomic, strong) VRGCalendarView *calendar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addCalendarAndLabels];
    
    UIButton *backDate = [UIButton buttonWithType:(UIButtonTypeCustom)];
    backDate.frame = CGRectMake(280, 300, 100, 30);
    [backDate setTitle:@"回到今天" forState:(UIControlStateNormal)];
    backDate.titleLabel.font = [UIFont systemFontOfSize:12];
    [backDate setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [backDate addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:backDate];
}

/// 添加日历 两个label
- (void)addCalendarAndLabels
{
    // 日历
    self.calendar = [[VRGCalendarView alloc] init];
    _calendar.delegate = self;
    CGFloat calendarX = 0;
    CGFloat calendarY = 20;
    CGFloat calendarW = CWScreenW;
    CGFloat calendarH = 8 * kVRGCalendarViewDayHeight;
    _calendar.frame =CGRectMake(calendarX, calendarY, calendarW, calendarH);
    [self.view addSubview:_calendar];
}

// 回到今日
- (void)back:(UIButton *)button
{
    [_calendar reset];
}

// 代理方法

-(void)calendarView:(VRGCalendarView *)calendarView switchedToMonth:(int)month targetHeight:(float)targetHeight animated:(BOOL)animated
{
    
}

- (void)calendarView:(VRGCalendarView *)calendarView dateSelected:(NSDate *)date
{
    NSLog(@"date:%@", date);
    // 手动选择某一天会调用
    //=================================
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    NSInteger chosedYear = [components year];
    NSInteger chosedMonth = [components month];
    NSInteger chosedDay = [components day];
    NSString *dateStr = [NSString stringWithFormat:@"%ld-%02ld-%02ld",(long)chosedYear,(long)chosedMonth,(long)chosedDay];
    
    
    NSLog(@"dateStr:%@", dateStr);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
