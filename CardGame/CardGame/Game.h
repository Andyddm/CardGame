//
//  Game.h
//  CardGame
//
//  Created by tarena on 15-6-5.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Poker.h"
/*
Game:游戏类 用于描述游戏的具体规则
需要这样几个能力:
1)存储:能够存储随机出来的12张纸牌对象
2)行为:
    a.在游戏开始时,随机抽取出纸牌
    b.根据选中的纸牌,进行比对
*/
@interface Game : NSObject

@property(nonatomic,strong)NSMutableArray *allRandomCards;
//自定义的构造
//从传入的poker属性中,抽取count张纸牌
-(instancetype)initWithNumberOfCards:(NSUInteger)count inPoker:(Poker *)poker;

//最核心的业务方法,用于根据传入的点击的牌的位置
//更改数据状态
-(void)chooseCardAtIndex:(NSInteger)index;

@end







