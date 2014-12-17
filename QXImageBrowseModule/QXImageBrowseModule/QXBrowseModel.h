//
//  QXBrowseModel.h
//  QXImageBrowseModule
//
//  Created by 亓鑫 on 14/12/16.
//  Copyright (c) 2014年 亓鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QXBrowseModel : NSObject
@property (copy, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) UIImage *image;//通过url获取成功后才会有值.
@end
