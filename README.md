QXImageBrowse
=============

常用图片浏览工具(轻型)

1.需要使用QXBrowseModel作为model传递,如果需要其他字段可以增加.
2.可以在初始化页面时候lookIndex字段传递你需要观察的第几张图片.(注意:index不要越界)


演示效果:

![image](https://raw.githubusercontent.com/qixin1106/QXImageBrowse/master/QXImageBrowseModule.gif)




### DATA

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



### INIT

    QXBrowseVC *vc = [[QXBrowseVC alloc] initWithDataArray:dataArray
                                                 lookIndex:dataArray.count-1];
    [self presentViewController:vc animated:YES completion:NULL];


