//
//  Poker.m
//  CardGame
//
//  Created by tarena on 15-6-5.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "Poker.h"
#import "Card.h"

@implementation Poker

//lazy loading 懒加载 不到最后一刻就不分配空间
//通过重写属性的get方法,保证在第一次访问这是个属性
//时,通过判断,该属性背后的实例变量是否为nil
//来决定是否为该属性分配空间
//如果,经判断  实例变量为nil,则分配
//如果,不是nil,说明已经分配过了,那么就直接返回
//毕竟重写的是属性的get方法,也就是只有不得不读
//这个属性时,才会找到这个方法,于是,分配空间的时机
//就是不得不用了,再分配,这种通过重写get方法
//来实现晚一些时间创建空间的方法,叫懒加载
- (NSMutableArray *)allCards{
    //!_allCards  等价形式  _allCards==nil
    if (!_allCards) {
        _allCards = [NSMutableArray array];
    }
    return _allCards;
}


- (id)init{
    self = [super init];
    //self 等价形式   self!=nil
    if (self) {
        //1.存储牌的数组空间分配出来
        // 此句已有get方法替换
        //self.allCards = [NSMutableArray array];
        //2.利用已有的所有花色和大小进行组合
        //生成全部的52张纸牌
        for (NSString *suit in [Card allSuit]) {
            for (NSString *rank in [Card allRank]) {
                Card *card = [[Card alloc]initWithSuit:suit andRank:rank];
                [self.allCards addObject:card];
            }
        }
    }
    return  self;
}


@end
