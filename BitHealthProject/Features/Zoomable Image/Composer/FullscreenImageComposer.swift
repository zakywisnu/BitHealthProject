//
//  FullscreenImageComposer.swift
//  BitHealthProject
//
//  Created by Ahmad Zaky W on 09/10/23.
//

import UIKit

public final class FullscreenImageComposer {
    
    private init() {}
    
    public static func composeFullscreen(image: String) -> FullscreenImageViewController {
        return FullscreenImageViewController(image: image)
    }
    
}
