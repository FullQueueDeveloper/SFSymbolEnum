import Foundation

func readSymbolsAndYears(from fileURL: URL) throws -> ([SymbolTuple], Releases) {
  let data = try Data.init(contentsOf: fileURL, options: .mappedIfSafe)
  let propertyList = try PropertyListSerialization.propertyList(from: data, options: [], format:nil) as! Dictionary<String, Any>

  let symbols     = propertyList["symbols"] as! Symbols
  let releases    = propertyList["year_to_release"] as! Releases

  let releaseDatesFromSymbols     = Set<ReleaseDate>(symbols.values)
  let releaseDatesFromReleases    = Set<ReleaseDate>(releases.keys)

  assert(releaseDatesFromReleases.isSubset(of: releaseDatesFromSymbols), "There are symbols with releasedates that have no release versions \(releaseDatesFromReleases) < \(releaseDatesFromSymbols)")

  let sortedSymbolTuple = symbols
    .sorted { $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value}
    .map { SymbolTuple(symbol: $0.key, released: $0.value) }

  return (sortedSymbolTuple, releases)
}
