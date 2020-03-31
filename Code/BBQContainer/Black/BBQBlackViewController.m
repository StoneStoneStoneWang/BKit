//
//  BBQBlackViewController.m
//  BBQContainer
//
//  Created by 王磊 on 2020/3/31.
//  Copyright © 2020 王磊. All rights reserved.
//

#import "BBQBlackViewController.h"
@import SToolsKit;
@import Masonry;
@import SDWebImage;
@interface BBQBlackTableViewCell()

@property (nonatomic ,strong) UIImageView *iconImageView;

@property (nonatomic ,strong) UILabel *nameLabel;

@property (nonatomic ,strong) UILabel *timeLabel;

@end

@implementation BBQBlackTableViewCell

- (UIImageView *)iconImageView {
    
    if (!_iconImageView) {
        
        _iconImageView = [UIImageView new];
        
        _iconImageView.contentMode = UIViewContentModeCenter;
        
        _iconImageView.layer.cornerRadius = 5;
        
        _iconImageView.layer.masksToBounds = true;
    }
    return _iconImageView;
}
- (UILabel *)nameLabel {
    
    if (!_nameLabel) {
        
        _nameLabel = [UILabel new];
        
        _nameLabel.font = [UIFont systemFontOfSize:15];
        
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        
        _nameLabel.textColor = [UIColor s_transformToColorByHexColorStr:@"#333333"];
        
    }
    return _nameLabel;
}
- (UILabel *)timeLabel {
    
    if (!_timeLabel) {
        
        _timeLabel = [UILabel new];
        
        _timeLabel.font = [UIFont systemFontOfSize:13];
        
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        
        _timeLabel.textColor = [UIColor s_transformToColorByHexColorStr:@"#999999"];
    }
    return _timeLabel;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self commitInit];
    }
    return self;
}

- (void)commitInit {
    
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.iconImageView];
    
    [self.contentView addSubview:self.nameLabel];
    
    [self.contentView addSubview:self.timeLabel];
}

- (void)setBlack:(BBQBlackBean *)black {
//    _black = black;
    
    self.timeLabel.text = [[NSString stringWithFormat:@"%ld",black.intime / 1000] s_convertToDate:SDateTypeDateStyle];
    
    self.nameLabel.text = black.users.nickname;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?x-oss-process=image/resize,w_200,h_200",black.users.headImg]] placeholderImage:[UIImage imageNamed:@BBQLogoIcon] options:SDWebImageRefreshCached];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat w = CGRectGetHeight(self.bounds) - 30;
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.mas_equalTo(15);
        
        make.bottom.mas_equalTo(-15);
        
        make.width.mas_equalTo(w);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.iconImageView.mas_right).offset(15);
        
        make.bottom.equalTo(self.iconImageView.mas_centerY).offset(-3);
        
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.iconImageView.mas_right).offset(15);
        
        make.top.equalTo(self.iconImageView.mas_centerY).offset(3);
    }];
}
@end

@interface BBQBlackViewController ()

@property (nonatomic ,strong) BBQBlackBridge *bridge;

@end

@implementation BBQBlackViewController

+ (instancetype)createBlack {
    
    return [self new];
}
- (void)configOwnSubViews {
    [super configOwnSubViews];
    
    [self.tableView registerClass:[BBQBlackTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.tableView.mj_header beginRefreshing];
}

- (UITableViewCell *)configTableViewCell:(id)data forIndexPath:(NSIndexPath *)ip {
    
    BBQBlackTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.black = data;
    
    return cell;
}

- (CGFloat)caculateForCell:(id)data forIndexPath:(NSIndexPath *)ip {
    
    return 80;
}
- (void)configViewModel {
    
    self.bridge = [BBQBlackBridge new];
    
    [self.bridge createBlack:self :^(BBQBlackBean * _Nonnull black, NSIndexPath * _Nonnull ip) {
        
        
    }];
}

- (void)configNaviItem {
    
    self.title = @"黑名单";
}

- (BOOL)canPanResponse {
    
    return true;
}


@end