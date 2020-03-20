//
//  MainScene.m
//  DLGame2
//
//  Created by tanqiu on 2020/3/19.
//  Copyright © 2020 tanqiu. All rights reserved.
//

#import "MainScene.h"
#import "UserNode.h"
#import "EnemyNode.h"
#import "EnemyBossNode.h"
#import "BulletNode.h"
#import "Header.h"

@interface MainScene()<SKPhysicsContactDelegate>

@property (nonatomic, strong) SKTextureAtlas *bulletAtlas;

@property (nonatomic, strong) SKTextureAtlas *enemy1_downAtlas;

@property (nonatomic, strong) SKTextureAtlas *enemy2_downAtlas;

@property (nonatomic, strong) SKTextureAtlas *enemy3_downAtlas;

@property (nonatomic, strong) SKTextureAtlas *enemy3_nAtlas;

@property (nonatomic, strong) SKTextureAtlas *me_destoryAtlas;

@property (nonatomic, strong) SKTextureAtlas *meAtlas;


@property (nonatomic, strong) NSMutableArray *bulletArray;

@property (nonatomic, strong) NSMutableArray *enemy1_downArray;

@property (nonatomic, strong) NSMutableArray *enemy2_downArray;

@property (nonatomic, strong) NSMutableArray *enemy3_downArray;

@property (nonatomic, strong) NSMutableArray *enemy3_nArray;

@property (nonatomic, strong) NSMutableArray *me_destoryArray;

@property (nonatomic, strong) NSMutableArray *meArray;


@property (nonatomic, strong) SKCameraNode *cameraNode;


@property (nonatomic, strong) UserNode *userNode;

@property (nonatomic, strong) EnemyNode *soldierNode;

@property (nonatomic, strong) EnemyNode *bossNode;

@property (nonatomic, strong) SKAction *action;

@end

@implementation MainScene

static BOOL isPlane = YES;

-(instancetype)initWithSize:(CGSize)size{
    if ([super initWithSize:size]) {
        self.backgroundColor = [SKColor lightGrayColor];
        
        SKSpriteNode *backNode = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
        backNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        [self addChild:backNode];
        
//        self.physicsWorld.contactDelegate = self;
//        
//        self.physicsWorld.gravity = CGVectorMake(0, 0);
        
//        [self elements];
        
        self.userNode = [UserNode node];
        [self addChild:self.userNode];
        
        
        
        self.soldierNode = [EnemyNode createEnemy:EnemySoldier];
        [self addChild:self.soldierNode];
        
        self.bossNode = [EnemyNode createEnemy:EnemyBoss];
        [self addChild:self.bossNode];
        
    }
    return self;
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
    SKSpriteNode *nodeA;
    SKSpriteNode *nodeB;
    
    if (contact.bodyA.categoryBitMask == UserPhysicsCategory && contact.bodyB.categoryBitMask == EnemySoldierSmallBulletPhysicsCategory) {
        nodeA = (UserNode *)[contact.bodyA node];
        nodeB = (SKSpriteNode *)[contact.bodyB node];
        [nodeA removeFromParent];
        [nodeB removeFromParent];
    }
}

static int bullet = 0;
-(void)update:(NSTimeInterval)currentTime{
    if (bullet < 5) {
        bullet ++;
    }else{
        bullet = 0;
        [self.userNode shoot];
        [self.soldierNode shoot];
        [self.bossNode shoot];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:position];
    if ([node.name isEqualToString:@"user"]) {
        isPlane = YES;
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInNode:self];
    if (isPlane) {
        [self.userNode runAction:[SKAction moveTo:position duration:0.03]];
    }
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    isPlane = NO;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    isPlane = NO;
}

-(void)elements{
    self.bulletAtlas = [SKTextureAtlas atlasNamed:@"bullet"];
    self.enemy1_downAtlas = [SKTextureAtlas atlasNamed:@"enemy1_down"];
    self.enemy2_downAtlas = [SKTextureAtlas atlasNamed:@"enemy2_down"];
    self.enemy3_downAtlas = [SKTextureAtlas atlasNamed:@"enemy3_down"];
    self.enemy3_nAtlas = [SKTextureAtlas atlasNamed:@"enemy3_n"];
    self.me_destoryAtlas = [SKTextureAtlas atlasNamed:@"me_destory"];
    self.meAtlas = [SKTextureAtlas atlasNamed:@"me"];
    self.bulletArray = [[NSMutableArray alloc]init];
    self.enemy1_downArray = [[NSMutableArray alloc]init];
    self.enemy2_downArray = [[NSMutableArray alloc]init];
    self.enemy3_downArray = [[NSMutableArray alloc]init];
    self.enemy3_nArray = [[NSMutableArray alloc]init];
    self.me_destoryArray = [[NSMutableArray alloc]init];
    self.meArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < self.bulletAtlas.textureNames.count; i++) {
        [self.bulletArray addObject:[self.bulletAtlas textureNamed:[NSString stringWithFormat:@"bullet%d.png", i + 1]]];
    }
    for (int i = 0; i < self.enemy1_downAtlas.textureNames.count; i++) {
        [self.enemy1_downArray addObject:[self.enemy1_downAtlas textureNamed:[NSString stringWithFormat:@"enemy1_down%d.png", i + 1]]];
    }
    for (int i = 0; i < self.meAtlas.textureNames.count; i++) {
        [self.meArray addObject:[self.meAtlas textureNamed:[NSString stringWithFormat:@"me%d.png", i + 1]]];
    }
    for (int i = 0; i < self.enemy2_downAtlas.textureNames.count; i++) {
        [self.enemy2_downArray addObject:[self.enemy2_downAtlas textureNamed:[NSString stringWithFormat:@"enemy2_down%d.png", i + 1]]];
    }
    for (int i = 0; i < self.enemy3_nAtlas.textureNames.count; i++) {
        [self.enemy3_nArray addObject:[self.enemy3_nAtlas textureNamed:[NSString stringWithFormat:@"enemy3_n%d.png", i + 1]]];
    }
    for (int i = 0; i < self.enemy3_downAtlas.textureNames.count; i++) {
        [self.enemy3_downArray addObject:[self.enemy3_downAtlas textureNamed:[NSString stringWithFormat:@"enemy3_down%d.png", i + 1]]];
    }
    for (int i = 0; i < self.me_destoryAtlas.textureNames.count; i++) {
        [self.me_destoryArray addObject:[self.me_destoryAtlas textureNamed:[NSString stringWithFormat:@"me_destory%d.png", i + 1]]];
    }
    
    
//        SKSpriteNode *enemy3_downNode = [SKSpriteNode spriteNodeWithTexture:self.enemy3_downArray[0]];
//        enemy3_downNode.position = CGPointMake(self.size.width / 2, self.size.height/2);
//        [self addChild:enemy3_downNode];
//
//        SKAction *animationAction = [SKAction animateWithTextures:self.enemy3_downArray timePerFrame:1];
//        [enemy3_downNode runAction:[SKAction repeatAction:animationAction count:10]];
}

@end
