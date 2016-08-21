//
//  AdvertiseView.h
//  SheBaoBao
//
//  Created by Jn_Kindle on 16/7/13.
//  Copyright © 2016年 HuaDa. All rights reserved.
//


#import <UIKit/UIKit.h>

/**遵循改代理可以监控到滚动视图的index*/
@protocol AdvertiseNetDelegate <NSObject>

@optional

/**点击滚动视图后触发*/
-(void)didSelectedNetImageAtIndex:(NSInteger)index;

@end

/** 遵循该代理就可以监控到本地滚动视图的index*/

@protocol AdvertiseLocalDelegate <NSObject>

@optional

/** 点中本地滚动视图后触发*/
-(void)didSelectedLocalImageAtIndex:(NSInteger)index;

@end

@interface AdvertiseView : UIView

/** 选中网络图片的索引*/
@property (nonatomic, strong) id <AdvertiseNetDelegate>netDelegate;

/** 选中本地图片的索引*/
@property (nonatomic, strong) id <AdvertiseLocalDelegate> localDelagate;


/** 占位图*/
@property (nonatomic, strong) UIImage *placeholderImage;

/** 滚动延时*/
@property (nonatomic, assign) NSTimeInterval AutoScrollDelay;


/**
 *  本地图片
 *
 *  @param frame      位置
 *  @param imageArray 加载本地图片
 *
 *  @return
 */
- (instancetype) initWithFrame:(CGRect)frame WithLocalImages:(NSArray *)imageArray;

/**
 *  加载网络图片
 *
 *  @param frame      位置大小
 *  @param imageArray 名字
 *
 *  @return
 */
- (instancetype) initWithFrame:(CGRect)frame WithNetImages:(NSArray *)imageArray;


@end
