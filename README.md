# SFSymbolEnum

A Swift package to have SF Symbols available as enum instead of strings.

## Example

A list of all available symbols

```swift
struct SFSymbolsView: View {
  var body: some View {
    VStack {
      List(SFSymbolName.allCases) { symbol in
        Label(symbol.rawValue, systemImage: symbol.rawValue)
      }
    }
  }
}
```

<img src="Images/Example.allCases.png" width="300" style="max-width: 50%; display: block; margin-left: auto; margin-right: auto;" />

## Advantages

- Compiler error when you mistype a SFSymbol name
- Autocompletion and suggestion for all SFSymbols:

<img src="Images/Example.completion.png" width="500" style="max-width: 100%; display: block; margin-left: auto; margin-right: auto;" />

- Images are _available_ depending on os and version like this:

<img src="Images/Example.availableError.png" width="500" style="max-width: 100%; display: block; margin-left: auto; margin-right: auto;" />

## Installation

### Xcode

- Add the package to your project: Xcode->Add Package Dependency add this url: https://github.com/FullQueueDeveloper/SFSymbolName
- Import in files like this:

```swift
import SFSymbolEnum
```

### XcodeGen

- Add the package to the top-level `packages` key

```yaml
packages:
  SFSymbolEnum:
    url: https://github.com/FullQueueDeveloper/SFSymbolName
    from: 3.0.1
```

- Add the package to your target's dependencies list:

```yaml
targets:
  App:
    type: application
    platform: iOS
    sources: [App]
    dependencies:
      - package: SFSymbolName
```

## How it's done

The code itself has been created with the `name_availablity.plist` inside the SF Symbols application.

### Generate enum

Swish script to generate the `enum`. Install [Swish](https://github.com/FullQueueDeveloper/Swish) from [HomeBrew](https://brew.sh), and run the `generate` script

```
brew tap fullqueuedeveloper/swish/swish
brew install swish
swish generate
```
