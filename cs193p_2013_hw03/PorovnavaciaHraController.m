//
//  PorovnavaciaHraController.m
//  cs193p_2013_hw03
//
//  Created by Marek Hrušovský on 2/18/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "PorovnavaciaHraController.h"
#import "BalicekHracichKariet.h"
#import "HraciaKarta.h"
#import "HraciaKartaCollectionViewCell.h"

@implementation PorovnavaciaHraController

- (BalicekKariet *)vytvorBalicekKariet {
    return [[BalicekHracichKariet alloc] init];
}


- (void)obnovCell:(UICollectionViewCell *)cell pouzitimKarty:(Karta *)karta {
    if ([cell isKindOfClass:[HraciaKartaCollectionViewCell class]]) {
        HraciaKartaView *hraciaKartaView = ((HraciaKartaCollectionViewCell *)cell).hraciaKartaView;
        if ([karta isKindOfClass:[HraciaKarta class]]) {
            HraciaKarta *hraciaKarta = (HraciaKarta *)karta;
            hraciaKartaView.farba = hraciaKarta.farba;
            hraciaKartaView.hodnota = hraciaKarta.hodnota;
            hraciaKartaView.otocenaCelnouStranou = hraciaKarta.otocenaCelnouStranou;
            hraciaKartaView.alpha = hraciaKarta.nehratelna ? 0.3 : 1.0;
        }
    }
}

- (NSUInteger)pociatocnyPocetKariet {
    return 22;
}

- (NSUInteger)pocetKarietNaZhodu {
    return 2;
}


@end
