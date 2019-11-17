//
// Created by mac on 2019-03-07.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit

protocol NibDefinable {
    var nibName: String { get }
}

@IBDesignable
public class NibView: UIView, NibDefinable {

    @IBOutlet weak var view: UIView!

    public var nibName: String {
        let name = NibView.className
        return name
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    private func nibSetup() {
        backgroundColor = .clear

        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true

        addSubview(view)
    }

    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView

        return nibView
    }

}
