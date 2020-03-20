//
//  EnemyNode.h
//  DLGame2
//
//  Created by tanqiu on 2020/3/19.
//  Copyright © 2020 tanqiu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(NSInteger, EnemyType) {
    EnemySoldier           =   1,       //  士兵
    EnemyBoss,                          //  boss
};

@interface EnemyNode : SKSpriteNode

+(instancetype)createEnemy:(EnemyType)type;

-(void)shoot;

@end
