//
//  EnemyBossNode.m
//  DLGame2
//
//  Created by tanqiu on 2020/3/19.
//  Copyright © 2020 tanqiu. All rights reserved.
//

#import "EnemyBossNode.h"
#import "BulletNode.h"
#import "Header.h"

@interface EnemyBossNode()

//@property (nonatomic, strong) SKNode *bulletNode;

@end

@implementation EnemyBossNode

-(instancetype)init{
    if ([super init]) {
        self =  [EnemyBossNode spriteNodeWithImageNamed:@"enemy2"];
        self.position = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.8, [UIScreen mainScreen].bounds.size.height * 0.8);
        self.name = @"EnemyBoss";
        [self runAction:[SKAction moveTo:CGPointMake(self.position.x, 0) duration:DLPointDistance(self.position, CGPointMake(self.position.x, 0)) / 20] completion:^{
            [self removeFromParent];
        }];
//        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
//        self.physicsBody.dynamic = YES;
//        self.physicsBody.pinned = NO;
//        self.physicsBody.categoryBitMask = EnemyBossPhysicsCategory;
//        self.physicsBody.contactTestBitMask = UserPhysicsCategory | UserSmallBulletPhysicsCategory | UserBigBulletPhysicsCategory;
    }
    return self;
}

-(void)shoot{
    BulletNode *node = [BulletNode createBullet:BigBullet];
    node.position = CGPointMake(self.position.x, self.position.y - self.size.height * 0.5);
    if (node) {
        [self.scene addChild:node];
    }
//    node.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:node.size];
//    node.physicsBody.dynamic = YES;
//    node.physicsBody.pinned = NO;
//    node.physicsBody.categoryBitMask = EnemyBossBigBulletPhysicsCategory;
//    node.physicsBody.contactTestBitMask = UserPhysicsCategory;
    [node runAction:[SKAction moveTo:CGPointMake(self.position.x, 0) duration:DLPointDistance(node.position, CGPointMake(self.position.x, 0)) / 40] completion:^{
        [node removeFromParent];
    }];
}

@end
