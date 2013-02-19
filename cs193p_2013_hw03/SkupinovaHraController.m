//
//  SkupinovaHraController.m
//  cs193p_2013_hw03
//
//  Created by Marek Hrušovský on 2/19/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "SkupinovaHraController.h"
#import "BalicekSkupinovychKariet.h"
#import "SkupinovaKarta.h"
#import "SkupinovaKartaCollectionViewCell.h"

@implementation SkupinovaHraController

- (BalicekKariet *)vytvorBalicekKariet {
    return [[BalicekSkupinovychKariet alloc] init];
}

- (void)obnovCell:(UICollectionViewCell *)cell pouzitimKarty:(Karta *)karta {
    if ([cell isKindOfClass:[SkupinovaKartaCollectionViewCell class]]) {
        SkupinovaKartaView *skupinovaKartaView = ((SkupinovaKartaCollectionViewCell *)cell).skupinovaKartaView;
        if ([karta isKindOfClass:[SkupinovaKarta class]]) {
            SkupinovaKarta *skupinovaKarta = (SkupinovaKarta *)karta;
            skupinovaKartaView.farba = skupinovaKarta.farba;
            skupinovaKartaView.tvar = skupinovaKarta.tvar;
            skupinovaKartaView.hodnota = skupinovaKarta.hodnota;
            skupinovaKartaView.odtien = skupinovaKarta.odtien;
            skupinovaKartaView.otocenaCelnouStranou = skupinovaKarta.otocenaCelnouStranou;
            skupinovaKartaView.alpha = skupinovaKarta.otocenaCelnouStranou ? 0.3 : 1.0;
        }
    }
}

- (NSUInteger)pociatocnyPocetKariet {
    return 12;
}

- (NSUInteger)pocetKarietNaZhodu {
    return 3;
}


@end
