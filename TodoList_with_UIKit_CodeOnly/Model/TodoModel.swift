//
//  TodoModel.swift
//  TodoList_with_UIKit_CodeOnly
//
//  Created by 조성빈 on 5/24/24.
//

import Foundation

class TodoModel: Identifiable, Codable {
    var id: UUID
    var body: String
    var date: Date
    var isComplete: Bool
    
    init(id: UUID, body: String, date: Date, isComplete: Bool) {
        self.id = id
        self.body = body
        self.date = date
        self.isComplete = isComplete
    }
    
    // 값이 존재하므로 UserDefaults에 저장되지 않는다.
    var dateString: String {
        let formatted = DateFormatter()
        formatted.dateFormat = "yy.MM.dd"
        return formatted.string(from: date)
    }
    
}

struct SampleTodoListData {
    var sampleList: [TodoModel] = []
    
    mutating func createSampleTodoData() {
        let todo1 = TodoModel(id: UUID(), body: "body1", date: Date(), isComplete: false)
        let todo2 = TodoModel(id: UUID(), body: "body2", date: Date(), isComplete: true)
        let todo3 = TodoModel(id: UUID(), body: "body3", date: Date(), isComplete: false)
        
        sampleList += [todo1, todo2, todo3]
    }
}
