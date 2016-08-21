//
//  ViewController.m
//  AdvertiseScrollView
//
//  Created by WJN on 16/3/25.
//  Copyright © 2016年 Lours. All rights reserved.
//

#import "ViewController.h"
#import "AdvertiseView.h"
@interface ViewController ()<AdvertiseNetDelegate,AdvertiseLocalDelegate>

/** 网络图片数组*/
@property(nonatomic,strong)NSArray *NetImageArray;

/** 本地图片数组*/
@property(nonatomic,strong)NSArray *localImageArray;


@end



@implementation ViewController


-(NSArray *)NetImageArray
{
    if(!_NetImageArray)
    {
        _NetImageArray = @[@"http://ws.xzhushou.cn/focusimg/201508201549023.jpg",@"http://ws.xzhushou.cn/focusimg/52.jpg",@"http://ws.xzhushou.cn/focusimg/51.jpg",@"http://ws.xzhushou.cn/focusimg/50.jpg"];
    }
    return _NetImageArray;
}

-(NSArray *)localImageArray
{
    if(!_localImageArray)
    {
        _localImageArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    }
    return _localImageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /** 创建网络滚动视图*/
    [self createNetScrollView];
    
    /** 创建本地滚动视图*/
    [self createLocalScrollView];
    
    
}

-(void)createNetScrollView
{
    /** 设置网络scrollView的Frame及所需图片*/
    AdvertiseView *scrollView = [[AdvertiseView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 200) WithNetImages:self.NetImageArray];
    
    /** 设置滚动延时*/
    scrollView.AutoScrollDelay = 3;
    
    /** 设置占位图*/
    scrollView.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
    
    
    /** 获取网络图片的index*/
    scrollView.netDelegate = self;
    
    /** 添加到当前View上*/
    [self.view addSubview:scrollView];
    
}

-(void)createLocalScrollView
{
    /** 设置本地scrollView的Frame及所需图片*/
    AdvertiseView *scrollView = [[AdvertiseView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 200) WithLocalImages:self.localImageArray];
    
    /** 设置滚动延时*/
    scrollView.AutoScrollDelay = 2;
    
    /** 获取本地图片的index*/
    scrollView.localDelagate = self;
    
    /** 添加到当前View上*/
    [self.view addSubview:scrollView];
}

/** 获取网络图片的index*/
-(void)didSelectedNetImageAtIndex:(NSInteger)index
{
    NSLog(@"点中图片的下标是:%ld",(long)index);
}

/** 获取本地图片的index*/
-(void)didSelectedLocalImageAtIndex:(NSInteger)index
{
    NSLog(@"点中本地图片的下标是:%ld",(long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
