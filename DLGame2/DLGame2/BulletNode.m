//
//  BulletNode.m
//  DLGame2
//
//  Created by tanqiu on 2020/3/19.
//  Copyright © 2020 tanqiu. All rights reserved.
//

#import "BulletNode.h"
#import "SmallBulletNode.h"
#import "BigBulletNode.h"

@implementation BulletNode

+(instancetype)createBullet:(BulletType)type{
    BulletNode *node;
    switch (type) {
        case SmallBullet:
            node = [SmallBulletNode node];
            break;
            
            case BigBullet:
            node = [BigBulletNode node];
            break;
            
        default:
            break;
    }
    
    return node;
}

@end
