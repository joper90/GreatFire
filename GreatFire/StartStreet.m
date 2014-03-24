//
//  StartStreet.m
//  GreatFire
//
//  Created by Joe on 24/03/2014.
//  Copyright (c) 2014 com.funkVoodoo. All rights reserved.
//

#import "StartStreet.h"
#import "Button.h"
#import "IntroScene.h"
#import "FireScene.h"

@implementation StartStreet

// -----------------------------------------------------------------------
#pragma mark - Create & Destroy
// -----------------------------------------------------------------------

+ (StartStreet *)scene
{
    return [[self alloc] init];
}

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
    //self.userInteractionEnabled = YES;
    
    // Create a colored background (Dark Grey)
    CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:1.0f]];
    [self addChild:background];
    
    //Add the cityscape
    CCSprite  *cityScape = [CCSprite spriteWithImageNamed:@"cityScape.png"];
    cityScape.position = ccp(512,200);
    [self addChild:cityScape];
    
    //Add the sun
    CCParticleSystem* partSystem = [CCParticleSystem particleWithFile:@"pSun.plist"];
    partSystem.position = ccp(800,600);
    [self addChild:partSystem];
    
    //Add next and home buttons
    Button *nextButton = [Button spriteWithImageNamed:@"nextButton.png"];
    nextButton.position = ccp(950,700);
    nextButton.scale = 0.5f;
    nextButton.name = @"nextButton";
    nextButton.sceneToMoveToo = [FireScene scene];
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


// -----------------------------------------------------------------------
#pragma mark - Method functions and callbacks
// -----------------------------------------------------------------------

-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CCLOG(@"Touched Scene");
}

@end
