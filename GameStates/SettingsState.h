//
//  SettingsState.h
//  Yaspeg
//
//  Created by Radex on 10-01-14.
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
#import "CheckBox.h"
#import "RadioButton.h"
#import "RadioButtonGroup.h"
#import "Button.h"

@interface SettingsState : GameState
{
   ImageLayer *headerLayer;
   CATextLayer*textLayer;
   
   CheckBox   *testCheckBox;
   RadioButton*testRadioButton;
   Button     *testButton;
   RadioButtonGroup *testGroup;
   
   CALayer    *flashLayer;
   CABasicAnimation *flashAnimation;
}

@end
