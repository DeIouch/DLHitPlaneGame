//
//  UserNode.m
//  DLGame2
//
//  Created by tanqiu on 2020/3/19.
//  Copyright © 2020 tanqiu. All rights reserved.
//

#import "UserNode.h"
#import "BulletNode.h"
#import "Header.h"

@implementation UserNode

-(instancetype)init{
    if ([super init]) {
        self =  [UserNode spriteNodeWithImageNamed:@"life"];
        self.position = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.2);
        self.name = @"user";
//        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
//        self.physicsBody.dynamic = YES;
//        self.physicsBody.pinned = NO;
//        self.physicsBody.categoryBitMask = UserPhysicsCategory;
//        self.physicsBody.contactTestBitMask = EnemySoldierBigBulletPhysicsCategory | EnemyBossBigBulletPhysicsCategory | EnemyBossSmallBulletPhysicsCategory | EnemySoldierSmallBulletPhysicsCategory;
    }
    return self;
}

-(void)shoot{
    BulletNode *node = [BulletNode createBullet:SmallBullet];
    node.position = CGPointMake(self.position.x, self.position.y + self.size.height * 0.5);
    if (node) {
        [self.scene addChild:node];
    }
//    node.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:node.size];
//    node.physicsBody.dynamic = YES;
//    node.physicsBody.categoryBitMask = UserSmallBulletPhysicsCategory;
//    node.physicsBody.contactTestBitMask = EnemyBossPhysicsCategory | EnemySoldierPhysicsCategory;
//    node.physicsBody.pinned = NO;
    [node runAction:[SKAction moveTo:CGPointMake(self.position.x, [UIScreen mainScreen].bounds.size.height) duration:DLPointDistance(node.position, CGPointMake(self.position.x, [UIScreen mainScreen].bounds.size.height)) / 200] completion:^{
        [node removeFromParent];
    }];
    
}

@end
