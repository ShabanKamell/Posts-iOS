//
// Created by mac on 2019-07-30.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

class ItemPicker<T: CustomStringConvertible>: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    private var list: [T] = []
    private var callback: ((T) -> Void)!
    private var isFirstDisplay = true

    open func create(
            list: [T],
            callback: @escaping (T) -> Void
    ) -> ItemPicker<T>{
        self.list = list
        self.callback = callback
        delegate = self
        dataSource = self

        return self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectDefaultItem(row: row)
        return list[row].description
    }

    private func selectDefaultItem(row: Int) {
        guard isFirstDisplay, row == 0  else { return }
        // select the first item on the first display
        callback(list[row])
        isFirstDisplay = false
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        callback(list[row])
    }

    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
    }
}