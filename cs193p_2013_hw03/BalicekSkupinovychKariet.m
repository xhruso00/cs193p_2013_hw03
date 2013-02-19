//
//  BalicekSkupinovychKariet.m
//  cs193p_2013_hw02
//
//  Created by Marek Hrušovský on 2/12/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "BalicekSkupinovychKariet.h"
#import "SkupinovaKarta.h"

@implementation BalicekSkupinovychKariet

- (id)init {
    
    self = [super init];
    
    if(self) {
        for (NSNumber *hodnota in [SkupinovaKarta vsetkyHodnoty]) {
            for (NSNumber *farba in [SkupinovaKarta platneFarby]) {
                for (NSNumber *tvar in [SkupinovaKarta platneTvary]) {
                    for (NSNumber *odtien in [SkupinovaKarta vsetkyOdtiene]) {
                        SkupinovaKarta *karta = [[SkupinovaKarta alloc] init];
                        karta.hodnota = [hodnota intValue];
                        karta.farba = [farba intValue];
                        karta.odtien = [odtien intValue];
                        karta.tvar = [tvar intValue];
                        karta.nehratelna = NO;
                        karta.otocenaCelnouStranou = NO;
                        [self pridajKartu:karta naVrch:YES];
                    
                    }
                }
            }
        }
    }
    return self;
}

@end
