import UIKit

// Isso precisa ser chamado manualmente no playground
public func initialize() {
    UIView.self.perform(Selector(("doBadSwizzleStuff")), with: nil)
    UIViewController.self.perform(Selector(("doBadSwizzleStuff")), with: nil)
}
