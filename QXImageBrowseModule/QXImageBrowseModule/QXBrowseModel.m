//
//  QXBrowseModel.m
//  QXImageBrowseModule
//
//  Created by 亓鑫 on 14/12/16.
//  Copyright (c) 2014年 亓鑫. All rights reserved.
//

#import "QXBrowseModel.h"

@implementation QXBrowseModel


- (void)assignImage:(UIImage*)image
{
    self->_image = image;
}


- (instancetype)init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}
@end
