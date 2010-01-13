//
//  GameState.h
//  Yaspeg2
//
//  Created by Radex on 10-01-03.
//  Copyright 2010 Radex. All rights reserved.
//

#import "ImageLayer.h"

@class YaspegController;

#pragma mark -
#pragma mark Game State Type

enum GameStateType_t
{
   MainMenu_GS,
   Authors_GS,
   
   None_GS
};

typedef enum GameStateType_t GameStateType;

#pragma mark -
#pragma mark Event Type enum

enum EventType_t
{
   KeyDown_ET,
   KeyUp_ET,
   MouseDown_ET,
   MouseDrag_ET,
   MouseUp_ET,
   None_ET
};

#define YK_ESC 27
#define YK_RETURN NSCarriageReturnCharacter
#define YK_ENTER NSEnterCharacter

typedef enum EventType_t EventType;

#pragma mark -
#pragma mark GameState

@interface GameState : NSObject
{
   YaspegController *yaspeg;
   
   EventType eventType;
   NSString *eventCharachters;
   bool      eventIsRepeat;
   NSPoint   eventMousePoint;
   bool      inited;
}

- (void) stateInit;
- (void) events;
- (void) logic;
- (void) render;

- (NSTimeInterval) outro;
- (void) cleanUp;

@property (assign, readwrite) YaspegController *yaspeg;

@property (assign, readwrite) EventType eventType;
@property (assign, readwrite) NSString *eventCharachters;
@property (assign, readwrite) bool      eventIsRepeat;
@property (assign, readwrite) NSPoint   eventMousePoint;

@end