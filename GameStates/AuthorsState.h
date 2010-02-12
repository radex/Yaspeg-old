//
//  AuthorsState.h
//  Yaspeg
//
//  Created by Radex on 10-01-12.
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

#import "GameState.h"
#import "YaspegController.h"

#import "BackButton.h"
#import "Background.h"
#import "Header.h"

@interface AuthorsState : GameState
{
   ImageLayer *scenarioLayer;
   ImageLayer *radexLayer;
   CATextLayer *thanksHeaderLayer;
   CATextLayer *thanksLayer;
   CATextLayer *footerLayer;
}

@end
