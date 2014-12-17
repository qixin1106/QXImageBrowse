//
//  ViewController.m
//  QXImageBrowseModule
//
//  Created by 亓鑫 on 14/12/9.
//  Copyright (c) 2014年 亓鑫. All rights reserved.
//

#import "ViewController.h"
#import "QXBrowseVC.h"
#import "QXBrowseModel.h"

#import "ImageLoader.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)clearCache:(UIButton *)sender
{
    [ImageLoader deleteCacheImage];
}

- (IBAction)onClick:(UIButton *)sender
{
    NSMutableArray *dataArray = [NSMutableArray array];
    /*测试数据******************************************************************/
    {
        QXBrowseModel *model = [[QXBrowseModel alloc] init];
        model.imageUrl = @"http://b.zol-img.com.cn/desk/bizhi/image/1/960x600/134849658379.jpg";
        [dataArray addObject:model];
    }
    {
        QXBrowseModel *model = [[QXBrowseModel alloc] init];
        model.imageUrl = @"http://www.5qdd.com/files/qqpifu/25-04/dd121025164K0-13.jpg";
        [dataArray addObject:model];
    }
    {
        QXBrowseModel *model = [[QXBrowseModel alloc] init];
        model.imageUrl = @"http://wenwen.soso.com/p/20111102/20111102220242-1110333906.jpg";
        [dataArray addObject:model];
    }
    {
        QXBrowseModel *model = [[QXBrowseModel alloc] init];
        model.imageUrl = @"http://pic.nipic.com/2007-10-18/2007101813025488_2.jpg";
        [dataArray addObject:model];
    }
    {
        QXBrowseModel *model = [[QXBrowseModel alloc] init];
        model.imageUrl = @"http://hdimages.takungpao.com/2013/1012/20131012103749451.jpg";
        [dataArray addObject:model];
    }
    /*测试数据******************************************************************/

    QXBrowseVC *vc = [[QXBrowseVC alloc] initWithDataArray:dataArray
                                                 lookIndex:dataArray.count-1];
    [self presentViewController:vc animated:YES completion:NULL];
}


@end
