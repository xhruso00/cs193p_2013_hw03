//
//  KartovaHra.h
//  cs193p_2013_hw03
//
//  Created by Marek Hrušovský on 2/19/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Karta.h"
#import "BalicekKariet.h"

@interface KartovaHra : NSObject

@property (nonatomic,readonly) int skore; 
@property (nonatomic,strong) NSMutableArray *poslednyTah; 
@property (nonatomic)int pocetKarietNaZhodu; 
@property (strong,nonatomic) NSMutableArray *karty;

- (id)initWithPocetKariet:(NSUInteger)pocetKariet
   pouzitimBalickahKariet:(BalicekKariet *) balicek
            karietNaZhodu:(NSUInteger)pocetKarietNaZhodu;
- (void)otocKartuNaIndexe:(NSUInteger)index; 
- (Karta *)kartaNaIndexe:(NSUInteger)index; 
- (void)zmazKartyNaIndexoch:(NSIndexSet *)index;
- (NSUInteger)pridajKartu;
- (NSUInteger)pocetKarietVHre;

@end
