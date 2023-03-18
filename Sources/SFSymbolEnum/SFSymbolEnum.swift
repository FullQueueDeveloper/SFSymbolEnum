import SwiftUI

public extension SFSymbol {
  var name: String { return self.rawValue }
}

@available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
public extension Image {

  @available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
  init(sfsymbol: SFSymbol) {
    self = Image(systemName: sfsymbol.name)
  }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public func Label(_ title: LocalizedStringKey, sfsymbol: SFSymbol) -> Label<Text, Image> {
  Label(title, systemImage: sfsymbol.name)
}
