//
//  Game.m
//  CardGame
//
//  Created by tarena on 15-6-5.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "Game.h"
#import "Card.h"

@implementation Game

// 重写完此方法,代表使用allRandomCard属性时
// 对应的数组空间一定已经存在了
- (NSMutableArray *)allRandomCards{
    if (!_allRandomCards) {
        _allRandomCards = [NSMutableArray array];
    }
    return _allRandomCards;
}

- (instancetype)initWithNumberOfCards:(NSUInteger)count inPoker:(Poker *)poker{
    self = [super init];
    if (self) {
        //目标:抽取count次纸牌
        for (NSInteger i=0; i<count; i++) {
            // 从poker的52张牌随机抽取
            // 利用c函数随机出一个有效下标
            // 根据poker参数 当前剩余的纸牌
            // 总个数来决定有效下标的范围
            unsigned int index = arc4random()%poker.allCards.count;
            // 按照随机的index到传入的poker参数中取到该位置的纸牌
            Card *randomCard = poker.allCards[index];
            //  将抽取的纸牌添加到allRandomCards属性中
            [self.allRandomCards addObject:randomCard];
            // 将该位置的牌从poker中移除以防重复抽取到
            [poker.allCards removeObjectAtIndex:index];
        }
    }
    return self;
}


/*
1.根据传入的位置信息获取到选中的那张纸牌对象
2.如果纸牌此时 面儿朝上,将牌变成背儿朝上
3.如果纸牌此时 背儿朝上
    a.将纸牌变成 面朝上
    b.将选中的纸牌与 剩下的所有(面朝上且还没有被匹配过的纸牌)其他纸牌进行比对
        if如果花色相同:则修改两张牌的matched为YES
        else if如果大小相同:则修改两张牌的matched为YES
        else 将被比对的那张牌 变成背儿朝上

*/
- (void)chooseCardAtIndex:(NSInteger)index{
    Card *choosedCard = self.allRandomCards[index];
    if (choosedCard.isFaceUp) {
        choosedCard.faceUp = NO;
    }else{// 背儿朝上
        choosedCard.faceUp = YES;
        for (NSInteger i=0; i<self.allRandomCards.count; i++) {
            if(i!=index){
                Card *otherCard = self.allRandomCards[i];
                if(otherCard.isFaceUp && !otherCard.matched){
                    if([otherCard.suit isEqualToString:choosedCard.suit]){
                        choosedCard.matched = YES;
                        otherCard.matched = YES;
                    }else if([otherCard.rank isEqualToString:choosedCard.rank]){
                        choosedCard.matched = YES;
                        otherCard.matched = YES;
                    }else{
                        otherCard.faceUp = NO;
                    }
                }
            }
        }
    }
}


@end








