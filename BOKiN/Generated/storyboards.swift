// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
  }
}

internal struct SceneType<T: Any> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal struct InitialSceneType<T: Any> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal protocol SegueType: RawRepresentable { }

internal extension UIViewController {
  func perform<S: SegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    let identifier = segue.rawValue
    performSegue(withIdentifier: identifier, sender: sender)
  }
}

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum AdMob: StoryboardType {
    internal static let storyboardName = "AdMob"

    internal static let initialScene = InitialSceneType<BOKiN.AdMobViewController>(storyboard: AdMob.self)
  }
  internal enum AdvertisementSettlementModalView: StoryboardType {
    internal static let storyboardName = "AdvertisementSettlementModalView"

    internal static let initialScene = InitialSceneType<BOKiN.AdvertisementSettlementModalViewController>(storyboard: AdvertisementSettlementModalView.self)

    internal static let advertisementSettlementModalView = SceneType<BOKiN.AdvertisementSettlementModalViewController>(storyboard: AdvertisementSettlementModalView.self, identifier: "AdvertisementSettlementModalView")
  }
  internal enum ApplePaySettlementModalView: StoryboardType {
    internal static let storyboardName = "ApplePaySettlementModalView"

    internal static let initialScene = InitialSceneType<BOKiN.ApplePaySettlementModalViewController>(storyboard: ApplePaySettlementModalView.self)

    internal static let applePaySettlementModalView = SceneType<BOKiN.ApplePaySettlementModalViewController>(storyboard: ApplePaySettlementModalView.self, identifier: "ApplePaySettlementModalView")
  }
  internal enum Bokin: StoryboardType {
    internal static let storyboardName = "Bokin"

    internal static let initialScene = InitialSceneType<BOKiN.BokinViewController>(storyboard: Bokin.self)
  }
  internal enum DisasterDetail: StoryboardType {
    internal static let storyboardName = "DisasterDetail"

    internal static let initialScene = InitialSceneType<BOKiN.DisasterDetailViewController>(storyboard: DisasterDetail.self)
  }
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIViewController>(storyboard: LaunchScreen.self)
  }
  internal enum Main: StoryboardType {
    internal static let storyboardName = "Main"

    internal static let initialScene = InitialSceneType<BOKiN.DisastersViewController>(storyboard: Main.self)
  }
  internal enum News: StoryboardType {
    internal static let storyboardName = "News"

    internal static let initialScene = InitialSceneType<BOKiN.NewsViewController>(storyboard: News.self)
  }
  internal enum OriginalNewsSite: StoryboardType {
    internal static let storyboardName = "OriginalNewsSite"

    internal static let initialScene = InitialSceneType<BOKiN.OriginalNewsSiteViewController>(storyboard: OriginalNewsSite.self)
  }
  internal enum SettlementModalView: StoryboardType {
    internal static let storyboardName = "SettlementModalView"

    internal static let initialScene = InitialSceneType<BOKiN.SettlementModalViewController>(storyboard: SettlementModalView.self)
  }
}

internal enum StoryboardSegue {
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

private final class BundleToken {}
