//
//  GameViewController.m
//  CardGame
//
//  Created by tarena on 15-6-4.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "GameViewController.h"
#import "Game.h"
#import "Poker.h"
#import "Card.h"
@interface GameViewController ()
//自己创建的一个数组,可以存储多个引用,每一个引用指向的是界面中系统创建的某一个按钮对象
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButtons;

// 使用模型类 模拟一个游戏
@property(nonatomic,strong)Game  *game;
@property(nonatomic,strong)Poker *poker;

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //创建扑克牌实例
    self.poker = [[Poker alloc]init];
    // 使用扑克牌创建游戏实例
    self.game = [[Game alloc]initWithNumberOfCards:self.allButtons.count inPoker:self.poker];
    [self showCards];
}

// 显示allRandomCards数组中的纸牌信息到
// allButtons上
-(void)showCards{
    for (UIButton *button in self.allButtons) {
        // 获取button在数组中的下标
        NSInteger i = [self.allButtons indexOfObject:button];
        // 根据下标i去游戏中找到该位置上的纸牌
        Card *card = self.game.allRandomCards[i];
        // card的信息对应到按钮时:
        // faceUp:YES 看到白色背景图+牌面信息
        // faceUp:NO  看到花哨背景图+无任何牌面信息
        [button setBackgroundImage:[UIImage imageNamed:[self imageNameForCard:card]] forState:UIControlStateNormal];
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        // card   match   YES    NO
        // button enable  NO     YES
        [button setEnabled:!card.matched];
    }
}

//根据纸牌的faceUp状态,返回对应的背景图的名称
-(NSString *)imageNameForCard:(Card *)card{
    return card.isFaceUp?@"cardfront.png":@"cardback.png";
}

//根据纸牌的faceUp状态,返回对应的按钮上需显示的文字
-(NSString *)titleForCard:(Card *)card{
    return card.isFaceUp?card.cardInfo:@"";
}

//过程:
//1.获取点击的按钮的位置坐标
//2.将该坐标传给模型层,模型层就根据点击的坐标修改纸牌数据的状态
//3.更新所有纸牌信息到按钮上
- (IBAction)clickedButton:(UIButton *)sender{
    // 获取点击的按钮在数组中的位置
    NSInteger index = [self.allButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:index];
    [self showCards];
}








@end
