//
//  ViewController.m
//  QXImageBrowseModule
//
//  Created by 亓鑫 on 14/12/9.
//  Copyright (c) 2014年 亓鑫. All rights reserved.
//

#import "ViewController.h"
#import "QXBrowseVC.h"


@interface ViewController ()

@end

@implementation ViewController


- (IBAction)onClick:(UIButton *)sender
{
    QXBrowseVC *vc = [[QXBrowseVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
