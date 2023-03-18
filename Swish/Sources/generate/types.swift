typealias ReleaseDate = String
typealias Symbol = String
typealias Symbols = [Symbol: ReleaseDate]
typealias Release = [String: String]
typealias Releases = [ReleaseDate: Release]
typealias SymbolTuple = (symbol: Symbol, released: ReleaseDate)

extension Release {
  var availabilty: String {
    "available("
    + self
      .map { (os, version) in os + " " + version }
      .sorted()
      .joined(separator: ", ")
    + ", *)"
  }
}

extension Symbol {
  var replacementName: String {
    guard !Set(["return", "case", "repeat"]).contains(self) else {
      return "`" + self + "`"
    }
    let parts = components(separatedBy: ".")
    let firstElement = parts.first!
    let camelCase = firstElement
      + parts
        .dropFirst()
        .map { $0.prefix(1).uppercased() + $0.dropFirst() }
        .joined(separator: "")
    return camelCase.first?.isNumber == true ? "number" + camelCase : camelCase
  }
}
