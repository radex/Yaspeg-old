//
//  Button.m
//  Yaspeg2
//
//  Created by Radex on 10-01-23.
//  Copyright 2010 Radex. All rights reserved.
//  
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//  
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//  
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import "Button.h"
#import "YaspegController.h"

@implementation Button

@synthesize state;

- (id) initWithLabel:(NSString*)label position:(NSPoint)position width:(int)width
{
   if(self = [super init])
   {
      yaspeg    = [YaspegController sharedYaspegController];
      gameState = yaspeg.currentState;
      
      self.frame = CGRectMake(position.x, position.y, width, 53);
      
      // left side
      
      leftLayer = [ImageLayer layerWithImageNamed:@"button-left.png"];
      leftLayer.opacity = -2;
      
      [self addSublayer:leftLayer];
      
      // right side
      
      rightLayer   = [ImageLayer layerWithImageNamed:@"button-left.png"];
      rightLayer.x = width - 15;
      
      rightLayer.opacity   = -2;
      rightLayer.transform = CATransform3DMakeScale(-1, 1, 1);
      
      [self addSublayer:rightLayer];
      
      // background
      
      bgLayer   = [ImageLayer layerWithImageNamed:@"button-bg.png"];
      bgLayer.x = 15;
      bgLayer.w = width - 30;
      
      bgLayer.opacity = -2;
      [self addSublayer:bgLayer];
      
      // flipped left side
      
      leftFlippedLayer = [ImageLayer layerWithImageNamed:@"button-left.png"];
      leftFlippedLayer.opacity   = 0;
      leftFlippedLayer.transform = CATransform3DMakeScale(1, -1, 1);
      
      [self addSublayer:leftFlippedLayer];
      
      // flipped right side
      
      rightFlippedLayer   = [ImageLayer layerWithImageNamed:@"button-left.png"];
      rightFlippedLayer.x = width - 15;
      
      rightFlippedLayer.opacity   = 0;
      rightFlippedLayer.transform = CATransform3DMakeScale(-1, -1, 1);
      
      [self addSublayer:rightFlippedLayer];
      
      // flipped background
      
      bgFlippedLayer   = [ImageLayer layerWithImageNamed:@"button-bg.png"];
      bgFlippedLayer.x = 15;
      bgFlippedLayer.w = width - 30;
      
      bgFlippedLayer.opacity   = 0;
      bgFlippedLayer.transform = CATransform3DMakeScale(1, -1, 1);
      [self addSublayer:bgFlippedLayer];
      
      // label
      
      labelLayer          = [CATextLayer layer];
      labelLayer.frame    = CGRectMake(0, 10, width, 30);
      labelLayer.font     = @"palatino";
      labelLayer.fontSize = 24;
      labelLayer.string   = label;
      labelLayer.alignmentMode   = kCAAlignmentCenter;
      labelLayer.foregroundColor = CGColorCreateGenericRGB(0, 0, 0, 1);
      labelLayer.opacity  = 0;
      
      [self addSublayer:labelLayer];
      
      /***/
      
      [self setNeedsDisplay];
      
      [yaspeg.rootLayer addSublayer:self];
   }
   
   return self;
}

+ (id) buttonWithLabel:(NSString*)label position:(NSPoint)position width:(int)width
{
   return [[self alloc] initWithLabel:label position:position width:width];
}

- (int) handleEvents
{
   if(gameState.eventType == MouseMove_ET)
   {
      if([self isInBounds:gameState.eventMousePoint])
      {
         leftFlippedLayer.opacity  = 1;
         rightFlippedLayer.opacity = 1;
         bgFlippedLayer.opacity    = 1;
      }
      else
      {
         leftFlippedLayer.opacity  = 0;
         rightFlippedLayer.opacity = 0;
         bgFlippedLayer.opacity    = 0;
      }
   }
   
   if(gameState.eventType == MouseUp_ET && [self isInBounds:gameState.eventMousePoint])
   {
      return 1; // 1 if clicked
   }
   
   return 0; // 0 if nothing happened
}

- (void) handleRender
{
   leftLayer.opacity  = 1;
   rightLayer.opacity = 1;
   bgLayer.opacity    = 1;
   
   labelLayer.opacity = 1;
}

- (void) handleOutro
{
   leftLayer.opacity  = -2;
   rightLayer.opacity = -2;
   bgLayer.opacity    = -2;
   
   leftFlippedLayer.opacity  = -2;
   rightFlippedLayer.opacity = -2;
   bgFlippedLayer.opacity    = -2;
   
   labelLayer.opacity = 0;
}

@end
