//
//  BulletNode.h
//  DLGame2
//
//  Created by tanqiu on 2020/3/19.
//  Copyright © 2020 tanqiu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(NSInteger, BulletType) {
    SmallBullet         =   1,  //  小子弹
    BigBullet,                    //  大子弹
};

@interface BulletNode : SKSpriteNode

+(instancetype)createBullet:(BulletType)type;

@end
