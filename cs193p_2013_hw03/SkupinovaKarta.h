//
//  SkupinovaKarta.h
//  cs193p_2013_hw02
//
//  Created by Marek Hrušovský on 2/12/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "Karta.h"

typedef NS_ENUM(NSInteger, FarbaSkupinovejKarty) {
    CervenaFarbaSkupinovejKarty = 1,
    ZelenaFarbaSkupinovejKarty,
    ModraFarbaSkupinovejKarty
};

typedef NS_ENUM(NSInteger, TvarSkupinovejKarty) {
    GulockovyTvarSkupinovejKarty = 1,
    TrojuholnikovyTvarSkupinovejKarty,
    StvorcovyTvarSkupinovejKarty
};

typedef NS_ENUM(NSInteger, OdtienSkupinovejKarty) {
    PrazdnyOdtienSkupinovejKarty = 1,
    VysrafovanyOdtienTvarSkupinovejKarty,
    PlnyOdtienSkupinovejKarty
};

@interface SkupinovaKarta : Karta

+ (NSArray *)platneFarby;
+ (NSArray *)platneTvary;
+ (NSArray *)vsetkyOdtiene;
+ (NSArray *)vsetkyHodnoty;
    
@property (nonatomic,setter = nastavHodnotu:) int hodnota;
@property (nonatomic,setter = nastavOdtien:) int odtien;
@property (nonatomic,setter = nastavFarbu:) int farba;
@property (nonatomic,setter = nastavTvar:) int tvar;

@end
