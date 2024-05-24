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
    
    func changeIsComplete(todo: TodoModel) {
        todo.isComplete.toggle()
    }
    
    
    // UserDefaults 사용한 메소드
    func saveTodos() {
        let encoder = JSONEncoder()
        if let encodedTodos = try? encoder.encode(todoList) {
            UserDefaults.standard.set(encodedTodos, forKey: "todos")
        }
    }
    
    func loadTodos() {
        if let savedTodos = UserDefaults.standard.object(forKey: "todos") as? Data {
            let decoder = JSONDecoder()
            if let loadedTodos = try? decoder.decode([TodoModel].self, from: savedTodos) {
                todoList = loadedTodos
                print("불러오기 완료")
            }
        }
    }
    
    func removeTodo(index: Int) {
        todoList.remove(at: index)
    }
    
    // 유저디폴트 저장된 값 json 형식 출력
//    func printSavedTodos() {
//        if let savedTodos = UserDefaults.standard.object(forKey: "todos") as? Data {
//            if let jsonString = String(data: savedTodos, encoding: .utf8) {
//                print(jsonString)
//            }
//        }
//    }
    
}
