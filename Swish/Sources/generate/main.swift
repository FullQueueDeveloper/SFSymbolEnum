import Foundation

let sfsymbolsPlistURL: URL = URL(fileURLWithPath: "/Applications/SF Symbols.app/Contents/Resources/Metadata-Public/name_availability.plist")

let (sortedSymbolTuple, releaseYears) = try readSymbolsAndYears(from: sfsymbolsPlistURL)

let outputContents = buildOutputContents(
  sortedSymbolTuple: sortedSymbolTuple,
  releaseYears: releaseYears)

try outputContents.write(
  toFile: "Sources/SFSymbolEnum/SFSymbolEnum.generated.swift",
  atomically: true,
  encoding: String.Encoding.utf8)
