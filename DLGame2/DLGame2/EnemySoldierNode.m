//
//  EnemySoldierNode.m
//  DLGame2
//
//  Created by tanqiu on 2020/3/19.
//  Copyright © 2020 tanqiu. All rights reserved.
//

#import "EnemySoldierNode.h"
#import "BulletNode.h"
#import "Header.h"

@interface EnemySoldierNode()

//@property (nonatomic, strong) SKNode *bulletNode;

@end

@implementation EnemySoldierNode

-(instancetype)init{
    if ([super init]) {
        self =  [EnemySoldierNode spriteNodeWithImageNamed:@"enemy1"];
        self.position = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.8);
        self.name = @"EnemySoldier";
        [self runAction:[SKAction moveTo:CGPointMake(self.position.x, 0) duration:DLPointDistance(self.position, CGPointMake(self.position.x, 0)) / 15] completion:^{
            [self removeFromParent];
        }];
//        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
//        self.physicsBody.dynamic = YES;
//        self.physicsBody.pinned = NO;
//        self.physicsBody.categoryBitMask = EnemySoldierPhysicsCategory;
//        self.physicsBody.contactTestBitMask = UserPhysicsCategory | UserSmallBulletPhysicsCategory | UserBigBulletPhysicsCategory;
    }
    return self;
}

-(void)shoot{
    BulletNode *node = [BulletNode createBullet:SmallBullet];
    node.position = CGPointMake(self.position.x, self.position.y - self.size.height * 0.5);;
    if (node) {
        [self.scene addChild:node];
    }
//    node.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:node.size];
//    node.physicsBody.dynamic = YES;
//    node.physicsBody.pinned = NO;
//    node.physicsBody.categoryBitMask = EnemySoldierSmallBulletPhysicsCategory;
//    node.physicsBody.contactTestBitMask = UserPhysicsCategory;
    [node runAction:[SKAction moveTo:CGPointMake(self.position.x, 0) duration:DLPointDistance(node.position, CGPointMake(self.position.x, 0)) / 30] completion:^{
        [node removeFromParent];
    }];
}

@end
