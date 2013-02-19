//
//  HraciaKartaCollectionViewCell.h
//  cs193p_2013_hw03
//
//  Created by Marek Hrušovský on 2/18/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HraciaKartaView.h"

@interface HraciaKartaCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet HraciaKartaView *hraciaKartaView;

@end
