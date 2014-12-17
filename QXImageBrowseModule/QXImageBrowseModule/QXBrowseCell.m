//
//  QXBrowseCell.m
//  QXImageBrowseModule
//
//  Created by 亓鑫 on 14/12/16.
//  Copyright (c) 2014年 亓鑫. All rights reserved.
//

#import "QXBrowseCell.h"
#import "ImageLoader.h"
#import "QXActivityView.h"

@interface QXBrowseCell ()
<UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *showImageView;
@property (strong, nonatomic) QXActivityView *activityView;
@end

@implementation QXBrowseCell








- (void)setBrowseModel:(QXBrowseModel*)browseModel
{
    if (_browseModel!=browseModel)
    {
        _browseModel = browseModel;
        self.showImageView.image = nil;
        [self.activityView startAnimation];
        [ImageLoader getImageWithURL:_browseModel.imageUrl
                          loadFinish:^(UIImage *img) {
                              self.showImageView.image = img;
                              self.browseModel.image = img;
                              [self.activityView stopAnimation];
                          } loadFailure:^{
                              [self.activityView stopAnimation];
                          }];
//            UIImage *image = _browseModel.image;
//
//            self.showImageView.image = image;
//            self.showImageView.frame = CGRectMake(0, (self.frame.size.height-self.frame.size.width*image.size.height/image.size.width)*0.5, self.frame.size.width, self.frame.size.width*image.size.height/image.size.width);
//        [ImageLoader getImageWithURL:_browseModel.imageUrl
//                         placeholder:nil
//                               block:^(UIImage *img) {
//                                   UIImage *image = img;
//                                   self.showImageView.image = image;
//                                   self.showImageView.frame = CGRectMake(0, (self.frame.size.height-self.frame.size.width*image.size.height/image.size.width)*0.5, self.frame.size.width, self.frame.size.width*image.size.height/image.size.width);
//                               }];

    }
}



- (void)singleTapClick:(UITapGestureRecognizer *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(singleTapCallBack:)])
    {
        [self.delegate singleTapCallBack:self];
    }
}


- (void)doubleTapClick:(UITapGestureRecognizer *)sender
{
    if (self.scrollView.zoomScale > 1.0)
    {
        [self.scrollView setZoomScale:1.0 animated:YES];
    }
    else
    {
        CGPoint point = [sender locationInView:self];
        [self.scrollView zoomToRect:CGRectMake(point.x,point.y,1,1) animated:YES];
    }
}


- (void)longPressClick:(UILongPressGestureRecognizer*)sender
{
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(longPressCallBack:)])
        {
            [self.delegate longPressCallBack:self];
        }
    }
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.scrollView.zoomScale = 1.0;
    self.scrollView.contentSize = self.bounds.size;
    self.showImageView.frame = self.bounds;
}



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.scrollView.delegate = self;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.contentSize = CGSizeMake(frame.size.width, frame.size.height);
        self.scrollView.minimumZoomScale = 1.0;
        self.scrollView.maximumZoomScale = 2.0;
        [self.contentView addSubview:self.scrollView];
        
        

        self.showImageView = [[UIImageView alloc] init];
        self.showImageView.frame = self.bounds;
        self.showImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView addSubview:self.showImageView];
        
        
        
        self.activityView =
        [[QXActivityView alloc] initWithCenter:CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5)
                                      diameter:30
                                     lineWidth:2.0];
        self.activityView.lineColor = [UIColor blackColor];
        [self.contentView addSubview:self.activityView];
        
        
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapClick:)];
        doubleTap.numberOfTapsRequired = 2;
        doubleTap.numberOfTouchesRequired = 1;
        [self.scrollView addGestureRecognizer:doubleTap];
        
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapClick:)];
        singleTap.numberOfTapsRequired = 1;
        singleTap.numberOfTouchesRequired = 1;
        [self.scrollView addGestureRecognizer:singleTap];
        
        UILongPressGestureRecognizer *longGes = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressClick:)];
        [self.scrollView addGestureRecognizer:longGes];
        
        [singleTap requireGestureRecognizerToFail:longGes];
        [singleTap requireGestureRecognizerToFail:doubleTap];


    }
    return self;
}










#pragma mark - UIScrollView Delegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.showImageView;
}


- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView
                       withView:(UIView *)view
                        atScale:(CGFloat)scale
{
    if (self.scrollView.zoomScale > 1)
    {
        [UIView animateWithDuration:0.15 animations:^{
            self.showImageView.center = CGPointMake(scrollView.contentSize.width*0.5,
                                                    scrollView.contentSize.height*0.5);
        }];
    }
    else
    {
        [UIView animateWithDuration:0.15 animations:^{
            self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width,
                                                     self.scrollView.bounds.size.height);
            self.showImageView.center = self.scrollView.center;
            
        }];
    }
}













@end
