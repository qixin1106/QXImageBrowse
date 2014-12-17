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
UICollectionViewDelegateFlowLayout,
QXBrowseCellDelegate,
UIActionSheetDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (assign, nonatomic) NSInteger lookIndex;
@end

@implementation QXBrowseVC





- (void)forcedToIndex:(NSInteger)index
{
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]
                                      animated:NO
                                scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}



#pragma mark - 生命周期
- (instancetype)initWithDataArray:(NSArray*)dataArray
                        lookIndex:(NSUInteger)index
{
    self = [super init];
    if (self)
    {
        self.lookIndex = (index>dataArray.count-1)?dataArray.count-1:index;
        
        self.dataArray = [NSMutableArray arrayWithArray:dataArray];
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.navigationController.navigationBarHidden = YES;
        
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
        self.collectionView.backgroundColor = [UIColor blackColor];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.pagingEnabled = YES;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.showsVerticalScrollIndicator = NO;
        [self.collectionView registerClass:[QXBrowseCell class] forCellWithReuseIdentifier:cellID];
        [self.view addSubview:self.collectionView];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self forcedToIndex:self.lookIndex];
    });
}












#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QXBrowseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.delegate = self;
    cell.indexPath = indexPath;
    cell.backgroundColor = [UIColor whiteColor];
    cell.browseModel = self.dataArray[indexPath.row];
    return cell;
}





#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
}















#pragma mark - QXBrowseCellDelegate
- (void)singleTapCallBack:(QXBrowseCell*)cell
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)longPressCallBack:(QXBrowseCell*)cell
{
    UIActionSheet *actionSheet =
    [[UIActionSheet alloc] initWithTitle:nil
                                delegate:self
                       cancelButtonTitle:@"取消"
                  destructiveButtonTitle:nil
                       otherButtonTitles:@"保存图片", nil];
    actionSheet.tag = cell.indexPath.row;
    [actionSheet showInView:self.view];
}












#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)//保存图片
    {
        QXBrowseModel *model = self.dataArray[actionSheet.tag];
        UIImageWriteToSavedPhotosAlbum(model.image, nil, nil, nil);
    }
}


@end
