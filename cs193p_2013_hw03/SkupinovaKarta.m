//
//  SkupinovaKarta.m
//  cs193p_2013_hw02
//
//  Created by Marek Hrušovský on 2/12/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "SkupinovaKarta.h"

@interface SkupinovaKarta ()

@end

@implementation SkupinovaKarta

- (NSString *)obsah {
    return [NSString stringWithFormat:@"%d %d %d %d",self.hodnota,self.tvar,self.farba,self.odtien];
}

+ (NSArray *)platneFarby {
    return  @[@(CervenaFarbaSkupinovejKarty),
              @(ZelenaFarbaSkupinovejKarty),
              @(ModraFarbaSkupinovejKarty)];
    //return @[@"R",@"G",@"B"];
}


+ (NSArray *)platneTvary {
    return  @[@(GulockovyTvarSkupinovejKarty),
              @(TrojuholnikovyTvarSkupinovejKarty),
              @(StvorcovyTvarSkupinovejKarty)];
    //return @[@"▲",@"●",@"■"];      
}

+ (NSArray *)vsetkyOdtiene {
    return  @[@(PrazdnyOdtienSkupinovejKarty),
              @(VysrafovanyOdtienTvarSkupinovejKarty),
              @(PlnyOdtienSkupinovejKarty)];
    //return @[@"solid", @"striped", @"open"];
}

+ (NSArray *)vsetkyHodnoty {
    return @[@(1),@(2),@(3)];
}


- (int)porovnajSKartami:(NSArray *)ineKarty {
    
    int skore = 0;
    int zhody = 0;
    if ([ineKarty count] == 2) {
        SkupinovaKarta *inaKarta1 = ineKarty[0];
        SkupinovaKarta *inaKarta2 = ineKarty[1];
        if(inaKarta1.farba == self.farba &&
           inaKarta2.farba == self.farba){
            zhody += 1;
        }
        else if (inaKarta1.farba != self.farba &&
                 inaKarta2.farba != self.farba &&
                 inaKarta2.farba != self.farba) {
            zhody += 1;
        }
        else
            return skore;
        if(inaKarta1.hodnota == self.hodnota &&
           inaKarta2.hodnota == self.hodnota){
            zhody += 1;
        }
        else if (inaKarta1.hodnota != self.hodnota &&
                 inaKarta2.hodnota != self.hodnota &&
                 inaKarta2.hodnota != self.hodnota) {
            zhody += 1;
        }
        else
            return skore;
        if(inaKarta1.tvar == self.tvar &&
           inaKarta2.tvar == self.tvar){
            zhody += 1;
        }
        else if (inaKarta1.tvar != self.tvar &&
                 inaKarta2.tvar != self.tvar &&
                 inaKarta2.tvar != self.tvar) {
            zhody += 1;
        }
        else
            return skore;
        if(inaKarta1.odtien == self.odtien &&
           inaKarta2.odtien == self.odtien){
            zhody += 1;
        }
        else if (inaKarta1.odtien != self.odtien &&
                 inaKarta2.odtien != self.odtien &&
                 inaKarta2.odtien != self.odtien) {
            zhody += 1;
        }
        else
            return skore;
        
        switch (zhody) {
            case 1:
                skore = 8;
                break;
            case 2:
                skore = 6;
                break;
            case 3:
                skore = 4;
                break;
            case 4:
                skore = 2;
                break;
            default:
                break;
        }
    }
    return skore;
}

- (void)nastavFarbu:(int)farba {
    if ([[SkupinovaKarta platneFarby] containsObject:@(farba)])
        _farba = farba;
}

- (void)nastavTvar:(int)tvar {
    if ([[SkupinovaKarta platneTvary] containsObject:@(tvar)])
        _tvar = tvar;
}

- (void)nastavOdtien:(int)odtien {
    if ([[SkupinovaKarta vsetkyOdtiene] containsObject:@(odtien)])
        _odtien = odtien;
}

- (void)nastavHodnotu:(int)hodnota {
    if([[SkupinovaKarta vsetkyHodnoty] containsObject:@(hodnota)])
        _hodnota = hodnota;
}

@end
