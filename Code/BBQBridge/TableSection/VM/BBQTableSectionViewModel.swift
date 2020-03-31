//
//  BBQTableSectionViewModel.swift
//  BBQBridge
//
//  Created by 王磊 on 2020/3/31.
//  Copyright © 2020 王磊. All rights reserved.
//

import Foundation
import WLBaseViewModel
import RxSwift
import RxCocoa

@objc (BBQTableSectionBean)
public final class BBQTableSectionBean: NSObject {
    
    @objc var sTag: Int = 0
    
    @objc var items: [BBQTableRowBean] = []
    
    @objc var title: String = ""
    
    @objc public static func createSection(_ sTag: Int,title: String ,items: [BBQTableRowBean]) -> BBQTableSectionBean {
        
        let section = BBQTableSectionBean()
        
        section.sTag = sTag
        
        section.title = title
        
        section.items += items
        
        return section
    }
    private override init() { }
}

@objc (BBQTableRowBean)
public final class BBQTableRowBean: NSObject {
    
    @objc var iTag: Int = 0
    
    @objc var title: String = ""
    
    @objc var icon: String = ""
    
    @objc public static func createSection(_ iTag: Int,title: String ,icon: String) -> BBQTableRowBean {
        
        let item = BBQTableRowBean()
        
        item.iTag = iTag
        
        item.title = title
        
        item.icon = icon
        
        return item
    }
    private override init() { }
}

struct BBQTableSectionViewModel: WLBaseViewModel {
    
    var input: WLInput
    
    var output: WLOutput
    
    struct WLInput {
        
        let modelSelect: ControlEvent<BBQTableRowBean>
        
        let itemSelect: ControlEvent<IndexPath>
        
        let sections: [BBQTableSectionBean]
    }
    
    struct WLOutput {
        // 获取轮播图序列
        let zip: Observable<(BBQTableRowBean,IndexPath)>
        
        let tableData: BehaviorRelay<[BBQTableSectionBean]> = BehaviorRelay<[BBQTableSectionBean]>(value:[])
    }
    
    init(_ input: WLInput ) {
        
        self.input = input
        
        output = WLOutput(zip: Observable.zip(input.modelSelect,input.itemSelect))
        
        output.tableData.accept(input.sections)
    }
}