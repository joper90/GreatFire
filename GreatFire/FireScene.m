//
//  FireScene.m
//  GreatFire
//
//  Created by Joe on 24/03/2014.
//  Copyright 2014 com.funkVoodoo. All rights reserved.
//

#import "FireScene.h"
#import "Button.h"
#import "IntroScene.h"

@implementation FireScene

// -----------------------------------------------------------------------
#pragma mark - Create & Destroy
// -----------------------------------------------------------------------

+ (FireScene *)scene
{
    return [[self alloc] init];
}

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
    self.userInteractionEnabled = YES;
    
    // Create a colored background (Dark Grey)
    CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f]];
    [self addChild:background];
    
    //Add the cityscape
    CCSprite  *cityScape = [CCSprite spriteWithImageNamed:@"cityScape.png"];
    cityScape.position = ccp(512,200);
    cityScape.zOrder = 100;
    [self addChild:cityScape];
    
    //Add the stars
    CCParticleSystem* partSystem = [CCParticleSystem particleWithFile:@"pStars.plist"];
    partSystem.position = ccp(512,600);
    [self addChild:partSystem];

    
    //Add next and home buttons
    Button *nextButton = [Button spriteWithImageNamed:@"nextButton.png"];
    nextButton.position = ccp(950,700);
    nextButton.scale = 0.5f;
    nextButton.name = @"nextButton";
    CCLOG(@"%@",nextButton.name);
    [self addChild:nextButton];
    
    
    Button *homeButton = [Button spriteWithImageNamed:@"homeButton.png"];
    homeButton.position = ccp(40,700);
    homeButton.scale = 0.5f;
    homeButton.name = @"homeButton";
    homeButton.sceneToMoveToo = [IntroScene scene];
    CCLOG(@"%@",homeButton.name);
    [self addChild:homeButton];
    
    return self;
}

- (void)dealloc
{
    // clean up code goes here
}

// -----------------------------------------------------------------------
#pragma mark - Enter & Exit
// -----------------------------------------------------------------------

- (void)onEnter
{
    // always call super onEnter first
    [super onEnter];
}


- (void)onExit
{
    // always call super onExit last
    [super onExit];
}




@end
