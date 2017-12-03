import UIKit
import PlaygroundSupport
@testable import Coffee_Shop

let coffeeShopViewController = CoffeeShopViewController()
let nav = UINavigationController(rootViewController: coffeeShopViewController)
let (parent, _) = playgroundControllers(device: .phone4_7inch, orientation: .landscape, child: nav)
let frame = parent.view.frame
PlaygroundPage.current.liveView = parent
parent.view.frame = frame
