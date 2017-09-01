//
//  TableViewCell.m
//  KVODemo
//
//  Created by YZY on 2017/6/30.
//  Copyright © 2017年 YZY. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell {
    
    __weak IBOutlet UILabel *_priceLabel;
}

- (void)setModel:(CellModel *)model {
    
    _model = model;
    
    [model addObserver: self forKeyPath: @"price" options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context: nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString: @"price"]) {
        
        
        _priceLabel.text = _model.price;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];

    [self addObserver: self forKeyPath: @"currentPrice" options: NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context: nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
