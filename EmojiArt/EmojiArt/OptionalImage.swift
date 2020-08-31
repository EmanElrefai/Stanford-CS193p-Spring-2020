//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Eman on 8/30/20.
//  Copyright © 2020 CS193p Stanford 2020. All rights reserved.
//

import SwiftUI

struct OptionalImage: View {
    
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}
