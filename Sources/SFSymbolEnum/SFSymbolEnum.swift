import SwiftUI

extension SFSymbol: Identifiable {
  public var id: String { rawValue }
  public var name: LocalizedStringKey { .init(rawValue) }
}

extension Image {
  @available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
  public  init(sfsymbol: SFSymbol) {
    self = Image(systemName: sfsymbol.rawValue)
  }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public func Label(_ title: LocalizedStringKey, sfsymbol: SFSymbol) -> Label<Text, Image> {
  Label(title, systemImage: sfsymbol.rawValue)
}
