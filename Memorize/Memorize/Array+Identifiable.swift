//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Eman on 8/25/20.
//  Copyright © 2020 CS193p Stanford 2020. All rights reserved.
//

import Foundation


extension Array where Element: Identifiable {
        func firstIndex(matching: Element)-> Int?{
            for index in 0..<self.count{
                if self[index].id == matching.id{
                    return index
                }
            }
            
            return nil
    }
}
