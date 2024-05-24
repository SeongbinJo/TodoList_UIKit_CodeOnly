//
//  AddTodoViewControllerDelegate.swift
//  TodoList_with_UIKit_CodeOnly
//
//  Created by 조성빈 on 5/24/24.
//

import UIKit

protocol AddTodoViewControllerDelegate: NSObject {
    func saveTodo(_ todo: TodoModel)
}
