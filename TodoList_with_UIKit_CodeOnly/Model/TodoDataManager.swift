//
//  TodoDataManager.swift
//  TodoList_with_UIKit_CodeOnly
//
//  Created by 조성빈 on 5/24/24.
//

import Foundation

class TodoDataManager {
    static let manager = TodoDataManager()
    private var todoList: [TodoModel]
    
    private init() {
        self.todoList = []
    }
    
    func countOfTodoList() -> Int {
        return todoList.count
    }
    
    func getTodo(index: Int) -> TodoModel {
        return todoList[index]
    }
    
    func getTodoList() -> [TodoModel] {
        return todoList
    }
    
    func addTodo(newTodo: TodoModel) {
        todoList.append(newTodo)
    }
    
    func removeTodo(index: Int) {
        todoList.remove(at: index)
    }
    
    
}
