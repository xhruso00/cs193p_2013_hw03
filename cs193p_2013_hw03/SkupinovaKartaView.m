//
//  SkupinovaKartaView.m
//  cs193p_2013_hw03
//
//  Created by Marek Hrušovský on 2/19/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "SkupinovaKartaView.h"
#import "SkupinovaKarta.h"
@interface SkupinovaKartaView()

@end

@implementation SkupinovaKartaView

#pragma mark - Drawing

#define CORNER_RADIUS 12.0

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CORNER_RADIUS];
    
    [roundedRect addClip];
    
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    [self vykresliObsah];

    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    
    
}

- (void)vykresliObsah {
    UIColor *farbaAOdtienKreslenia = [self farbaAOdtienKreslenia];
    UIBezierPath *tvarKreslenia = [self tvarKreslenia];
    
    for(int i = 0; i <self.hodnota; i++) {
        CGAffineTransform transform = CGAffineTransformMakeTranslation(1*self.bounds.size.width/5, i*self.bounds.size.height/6);
        [tvarKreslenia applyTransform:transform];
        
        [farbaAOdtienKreslenia setFill];
        [tvarKreslenia fill];
        [[farbaAOdtienKreslenia colorWithAlphaComponent:1.0] setStroke];
        [tvarKreslenia stroke];
    }
}

- (UIBezierPath *)tvarKreslenia {
    UIBezierPath *tvar;
    
    switch (self.tvar) {
        case GulockovyTvarSkupinovejKarty:
            tvar = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,
                                                                     0,
                                                                     self.bounds.size.width/3,
                                                                     self.bounds.size.height/3)];
            break;
        case TrojuholnikovyTvarSkupinovejKarty:
            tvar = [UIBezierPath bezierPath];
            [tvar moveToPoint:CGPointMake(0, self.bounds.size.height/3)];
            [tvar addLineToPoint:CGPointMake(self.bounds.size.width/3, self.bounds.size.height/3)];
            [tvar addLineToPoint:CGPointMake(self.bounds.size.width/6, 0)];
            [tvar addLineToPoint:CGPointMake(0, self.bounds.size.height/3)];
            [tvar closePath];
            break;
        case StvorcovyTvarSkupinovejKarty:
            tvar = [UIBezierPath bezierPathWithRect:CGRectMake(0,
                                                               0,
                                                               self.bounds.size.width/3,
                                                               self.bounds.size.height/3)];
            break;
        default:
            break;
    }
    return tvar;
}

- (UIColor *)farbaAOdtienKreslenia {
    UIColor *farbaKreslenia;
    switch (self.farba) {
        case CervenaFarbaSkupinovejKarty:
            farbaKreslenia = [UIColor redColor];
            break;
        case ZelenaFarbaSkupinovejKarty:
            farbaKreslenia = [UIColor greenColor];
            break;
        case ModraFarbaSkupinovejKarty:
            farbaKreslenia = [UIColor blueColor];
            break;
        default:
            farbaKreslenia = [UIColor blackColor];
            break;
    }
    
    float alpha = 0.0;
    switch (self.odtien) {
        case PrazdnyOdtienSkupinovejKarty:
            alpha = 0.0;
            break;
        case VysrafovanyOdtienTvarSkupinovejKarty:
            alpha = 0.4;
            break;
        case PlnyOdtienSkupinovejKarty:
            alpha = 1.0;
            break;
        default:
            break;
    }
 
    return [farbaKreslenia colorWithAlphaComponent:alpha];
}

- (void)nastavFarbu:(int)farba {
    if ([[SkupinovaKarta platneFarby] containsObject:@(farba)])
        _farba = farba;
    [self setNeedsDisplay];
}

- (void)nastavTvar:(int)tvar {
    if ([[SkupinovaKarta platneTvary] containsObject:@(tvar)])
        _tvar = tvar;
    [self setNeedsDisplay];
}

- (void)nastavOdtien:(int)odtien {
    if ([[SkupinovaKarta vsetkyOdtiene] containsObject:@(odtien)])
        _odtien = odtien;
    [self setNeedsDisplay];
}

- (void)nastavHodnotu:(int)hodnota {
    if([[SkupinovaKarta vsetkyHodnoty] containsObject:@(hodnota)])
        _hodnota = hodnota;
    [self setNeedsDisplay];
}

- (void)setOtocenaCelnouStranou:(BOOL)otocenaCelnouStranou
{
    _otocenaCelnouStranou = otocenaCelnouStranou;
    [self setNeedsDisplay];
}

#pragma mark - Initialization

- (void)setup
{
    // do initialization here
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

@end
