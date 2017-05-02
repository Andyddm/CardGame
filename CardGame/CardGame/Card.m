//
//  Card.m
//  CardGame
//
//  Created by tarena on 15-6-5.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "Card.h"

@implementation Card

- (instancetype)initWithSuit:(NSString *)suit andRank:(NSString *)rank{
    self = [super init];
    if (self) {
        self.suit = suit;
        self.rank = rank;
        self.faceUp = NO;
        self.matched = NO;
    }
    return self;
}

//提供所有有效的花色
+ (NSArray *)allSuit{
    return @[@"♠️",@"❤️",@"♣️",@"♦️"];
}

//提供所有有效的大小
+ (NSArray *)allRank{
    return @[@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

// suit属性的set方法
// 重写suit属性的set方法,只有当要赋的值存在于
// 合法的花色的数组中时,才将suit赋给实例变量
- (void)setSuit:(NSString *)suit{
    if ([[Card allSuit] containsObject:suit]) {
        _suit = suit;
    }
}

- (void)setRank:(NSString *)rank{
    if ([[Card allRank] containsObject:rank]) {
            _rank = rank;
    }
}
//为cardinfo这个只读属性提供get方法
//帮助外界读取要返回的牌面信息
- (NSString *)cardInfo{
    return [self.suit stringByAppendingString:self.rank];

}

@end
