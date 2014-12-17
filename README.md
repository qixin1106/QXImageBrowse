QXImageBrowse
=============

常用图片浏览工具(轻型)


演示效果:

![image](https://raw.githubusercontent.com/qixin1106/QXImageBrowse/master/QXImageBrowseModule.gif)


### INIT

    QXBrowseVC *vc = [[QXBrowseVC alloc] initWithDataArray:dataArray
                                                 lookIndex:dataArray.count-1];
    [self presentViewController:vc animated:YES completion:NULL];

