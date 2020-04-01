//
//  BBQAddressSelectedViewController.h
//  ZFragment
//
//  Created by three stone 王 on 2020/3/21.
//  Copyright © 2020 three stone 王. All rights reserved.
//
#import "BBQConfig.h"
@import BBQTable;
@import BBQBean;
@import BBQBridge;
NS_ASSUME_NONNULL_BEGIN

typedef void(^BBQAddressSelectedBlock)(BBQAddressActionType actionType,BBQAddressBean *_Nullable address ,NSIndexPath *_Nullable ip ,BBQBaseViewController *from);

@interface BBQAddressSelectedViewController : BBQTableLoadingViewController

+ (instancetype)createAddressSelectedWithBlock:(BBQAddressSelectedBlock) addressBlock;

- (void)updateAddress:(BBQAddressBean *)addressBean andIp:(NSIndexPath *)ip;

@end

NS_ASSUME_NONNULL_END
