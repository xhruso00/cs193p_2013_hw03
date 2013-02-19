//
//  ViewController.h
//  cs193p_2013_hw00
//
//  Created by Marek Hrušovský on 1/25/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BalicekKariet.h"
#import "KartovaHra.h"

@interface HraController : UIViewController {

}

- (BalicekKariet *)vytvorBalicekKariet; //abstract
- (void)obnovCell:(UICollectionViewCell *)cell pouzitimKarty:(Karta *)karta; //abstract
@property (nonatomic)NSUInteger pociatocnyPocetKariet;
@property (nonatomic)NSUInteger pocetKarietNaZhodu; //abstract

@end
