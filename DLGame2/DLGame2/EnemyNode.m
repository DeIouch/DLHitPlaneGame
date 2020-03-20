//
//  EnemyNode.m
//  DLGame2
//
//  Created by tanqiu on 2020/3/19.
//  Copyright © 2020 tanqiu. All rights reserved.
//

#import "EnemyNode.h"
#import "EnemySoldierNode.h"
#import "EnemyBossNode.h"

@implementation EnemyNode

+(instancetype)createEnemy:(EnemyType)type{
    EnemyNode *node;
    switch (type) {
        case EnemySoldier:
            node = [EnemySoldierNode node];
            break;
            
        case EnemyBoss:
            node = [EnemyBossNode node];
            break;
            
        default:
            break;
    }
    
    return node;
}

-(void)shoot{
    
}

@end
