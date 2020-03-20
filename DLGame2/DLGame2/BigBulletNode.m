//
//  BigBulletNode.m
//  DLGame2
//
//  Created by tanqiu on 2020/3/19.
//  Copyright © 2020 tanqiu. All rights reserved.
//

#import "BigBulletNode.h"

@implementation BigBulletNode

-(instancetype)init{
    if ([super init]) {
        self =  [BigBulletNode spriteNodeWithImageNamed:@"bullet2"];
//        self.position = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.8, [UIScreen mainScreen].bounds.size.height * 0.8);
        self.name = @"BigBullet";
    }
    return self;
}

@end
