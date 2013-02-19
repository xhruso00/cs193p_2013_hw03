//
//  ViewController.m
//  cs193p_2013_hw00
//
//  Created by Marek Hrušovský on 1/25/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "HraController.h"
#import "PoslednyTah.h"
#import "HraciaKarta.h"
#import "KartovaHra.h"

@interface HraController () <UICollectionViewDataSource>

@property (strong,nonatomic) KartovaHra *hra;
@property (weak, nonatomic) IBOutlet UILabel *skorePopisok;
@property (weak, nonatomic) IBOutlet UILabel *poslednyTahPopisok;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewKariet;

@end

@implementation HraController

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.hra pocetKarietVHre];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HraciaKarta" forIndexPath:indexPath];
    Karta *karta = [self.hra kartaNaIndexe:indexPath.item];
    [self obnovCell:cell pouzitimKarty:karta];
    return cell;
}

- (void)obnovCell:(UICollectionViewCell *)cell pouzitimKarty:(Karta *)karta {
    //abstract
}

- (KartovaHra *)hra {
    if(!_hra) {
        _hra = [[KartovaHra alloc] initWithPocetKariet:self.pociatocnyPocetKariet
                                pouzitimBalickahKariet:[self vytvorBalicekKariet]
                                         karietNaZhodu:self.pocetKarietNaZhodu];
    }
    return _hra;
}

- (IBAction)pridajKarty:(UIButton *)sender {
    NSUInteger index = [self.hra pridajKartu];
    if(index != NSNotFound) {
        NSArray *indexPaths = @[[NSIndexPath indexPathForItem:index inSection:0]];
        [self.collectionViewKariet insertItemsAtIndexPaths:indexPaths];
        [self.collectionViewKariet reloadItemsAtIndexPaths:indexPaths];
        [self.collectionViewKariet scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
    else {
        self.poslednyTahPopisok.text = @"Ziadna nova karta";
    }
}

- (IBAction)novaHra:(UIButton *)sender {
    self.skorePopisok.text = @"Skore: 0";
    self.poslednyTahPopisok.text = @"";
    self.hra = nil;
    [self.collectionViewKariet reloadData];
    [self obnovUI];
}
                      
- (BalicekKariet *)vytvorBalicekKariet { //abstract
    return nil;
}
                      

- (void)obnovUI {

    for (UICollectionViewCell *cell in [self.collectionViewKariet visibleCells]) {
        NSIndexPath *indexPath = [self.collectionViewKariet indexPathForCell:cell];
        Karta *karta = [self.hra kartaNaIndexe:indexPath.item];
        [self obnovCell:cell pouzitimKarty:karta];
        [self odstranNehratelneKarty];
    }
    self.skorePopisok.text = [NSString stringWithFormat:@"Skore: %d",self.hra.skore];
    self.poslednyTahPopisok.text = [self popisokPrePoslednyTah:[self.hra.poslednyTah lastObject]];
}

- (void)odstranNehratelneKarty {
    NSMutableIndexSet *indexy = [[NSMutableIndexSet alloc] init];
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    for (int i = 0; i<[self.collectionViewKariet numberOfItemsInSection:0]; i++) {
        Karta *karta = [self.hra kartaNaIndexe:i];
        if (karta.nehratelna) {
            [indexy addIndex:i];
            [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:0]];
        }
    }
    if ([indexy count]) {
        [self.hra zmazKartyNaIndexoch:indexy];
        [self.collectionViewKariet deleteItemsAtIndexPaths:indexPaths];
    }
}

- (NSString *)popisokPrePoslednyTah:(PoslednyTah *)tah {
    if (!tah) {
        return @"";
    }
    NSMutableString *popisok = [[NSMutableString alloc] init];
    [popisok appendFormat:@"%@ :",tah.stav];
    for (Karta *karta in tah.karty){
        [popisok appendFormat:@"%@ :",karta.obsah];
    }
    [popisok appendFormat:@"za %d body",tah.body];
    return [NSString stringWithString:popisok];
}


- (IBAction)otocKartu:(UITapGestureRecognizer *)gesto {
    CGPoint tapMiesto = [gesto locationInView:self.collectionViewKariet];
    NSIndexPath *indexPath = [self.collectionViewKariet indexPathForItemAtPoint:tapMiesto];
    if (indexPath) {
        [self.hra otocKartuNaIndexe:indexPath.item];
        [self obnovUI];
    }

    
}



@end
