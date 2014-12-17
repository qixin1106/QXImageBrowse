//
//  QXBrowseVC.m
//  QXImageBrowseModule
//
//  Created by 亓鑫 on 14/12/16.
//  Copyright (c) 2014年 亓鑫. All rights reserved.
//

#import "QXBrowseVC.h"
#import "QXBrowseCell.h"
#import "QXBrowseModel.h"

static NSString *cellID = @"QXBrowseCell.h";

@interface QXBrowseVC ()
<UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@end

@implementation QXBrowseVC




- (void)viewDidLoad
{
    [super viewDidLoad];
    /*测试数据******************************************************************/
    self.dataArray = [NSMutableArray array];
    {
        QXBrowseModel *model = [[QXBrowseModel alloc] init];
        model.imageUrl = @"http://b.zol-img.com.cn/desk/bizhi/image/1/960x600/134849658379.jpg";
        [self.dataArray addObject:model];
    }
    {
        QXBrowseModel *model = [[QXBrowseModel alloc] init];
        model.imageUrl = @"http://www.5qdd.com/files/qqpifu/25-04/dd121025164K0-13.jpg";
        [self.dataArray addObject:model];
    }
    {
        QXBrowseModel *model = [[QXBrowseModel alloc] init];
        model.imageUrl = @"http://wenwen.soso.com/p/20111102/20111102220242-1110333906.jpg";
        [self.dataArray addObject:model];
    }
    {
        QXBrowseModel *model = [[QXBrowseModel alloc] init];
        model.imageUrl = @"http://pic.nipic.com/2007-10-18/2007101813025488_2.jpg";
        [self.dataArray addObject:model];
    }
    {
        QXBrowseModel *model = [[QXBrowseModel alloc] init];
        model.imageUrl = @"http://hdimages.takungpao.com/2013/1012/20131012103749451.jpg";
        [self.dataArray addObject:model];
    }
    /*测试数据******************************************************************/



    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationController.navigationBarHidden = YES;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    [self.collectionView registerClass:[QXBrowseCell class] forCellWithReuseIdentifier:cellID];
    [self.view addSubview:self.collectionView];
}








#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QXBrowseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.browseModel = self.dataArray[indexPath.row];
    return cell;
}





#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
}


@end
