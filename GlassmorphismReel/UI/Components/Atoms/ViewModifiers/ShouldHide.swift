//
//  ShouldHide.swift
//  GlassmorphismReel
//
//  Created by Landon Johnson on 4/5/23.
//

import Foundation
import SwiftUI
extension View {
  @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
    switch shouldHide {
      case true: self.hidden()
      case false: self
    }
  }
}
