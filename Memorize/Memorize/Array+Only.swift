//
//  Array+Only.swift
//  Memorize
//
//  Created by Eman on 8/25/20.
//  Copyright © 2020 CS193p Stanford 2020. All rights reserved.
//

import Foundation

extension Array {
    var only : Element?{
        count == 1 ? first : nil 
    }
}
