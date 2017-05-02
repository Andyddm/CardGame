//
//  Card.h
//  CardGame
//
//  Created by tarena on 15-6-5.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
Card:纸牌类
    用于描述一张纸牌对象
属性:
花色(suit)
大小(rank)
状态:面儿朝上状态
状态:匹配状态
*/
@interface Card : NSObject

@property(nonatomic,strong)NSString *suit;
@property(nonatomic,strong)NSString *rank;
//getter这句代表的含义是:将系统默认生成的名字叫
//faceUp的get方法,重写改了个名字,叫isFaceUp
//以后再来读取该属性时,可以使用 isFaceUp这个名字
//来获取
@property(nonatomic,getter = isFaceUp)BOOL faceUp;
@property(nonatomic,getter = isMatched)BOOL matched;

//增加一个属性,为了方面外界快速获取到花色和大小的组合体
@property(nonatomic,strong,readonly)NSString *cardInfo;

-(instancetype)initWithSuit:(NSString *)suit andRank:(NSString *)rank;


+(NSArray *)allSuit;
+(NSArray *)allRank;


@end





