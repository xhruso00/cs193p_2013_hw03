//
//  SkupinovaKartaView.h
//  cs193p_2013_hw03
//
//  Created by Marek Hrušovský on 2/19/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkupinovaKartaView : UIView

@property (nonatomic,setter = nastavHodnotu:) int hodnota;
@property (nonatomic,setter = nastavOdtien:) int odtien;
@property (nonatomic,setter = nastavFarbu:) int farba;
@property (nonatomic,setter = nastavTvar:) int tvar;

@property (nonatomic) BOOL otocenaCelnouStranou;

@end
