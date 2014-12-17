//
//  QXBrowseCell.h
//  QXImageBrowseModule
//
//  Created by 亓鑫 on 14/12/16.
//  Copyright (c) 2014年 亓鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QXBrowseModel.h"


@protocol QXBrowseCellDelegate;
@interface QXBrowseCell : UICollectionViewCell
@property (weak, nonatomic) id<QXBrowseCellDelegate>delegate;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) QXBrowseModel *browseModel;
@end

@protocol QXBrowseCellDelegate <NSObject>
@optional
- (void)singleTapCallBack:(QXBrowseCell*)cell;
- (void)longPressCallBack:(QXBrowseCell*)cell;
@end