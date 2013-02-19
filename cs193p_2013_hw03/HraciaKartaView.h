//
//  HraciaKartaView.h
//  cs193p_2013_hw03
//
//  Created by Marek Hrušovský on 2/18/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HraciaKartaView : UIView

@property (nonatomic) NSUInteger hodnota;
@property (strong, nonatomic) NSString *farba;

@property (nonatomic) BOOL otocenaCelnouStranou;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@end
