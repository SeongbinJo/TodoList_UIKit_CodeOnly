//
//  TodoListTableViewCell.swift
//  TodoList_with_UIKit_CodeOnly
//
//  Created by 조성빈 on 5/24/24.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {
    let isCompleteImage = UIImageView()
    let body = UILabel()
    let dateString = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        dateString.textColor = .lightGray
        dateString.font = UIFont.systemFont(ofSize: 13)
        
        isCompleteImage.contentMode = .scaleAspectFit
        isCompleteImage.translatesAutoresizingMaskIntoConstraints = false
        body.translatesAutoresizingMaskIntoConstraints = false
        dateString.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(isCompleteImage)
        contentView.addSubview(body)
        contentView.addSubview(dateString)
        
        NSLayoutConstraint.activate([
            isCompleteImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            isCompleteImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            body.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            body.leadingAnchor.constraint(equalTo: isCompleteImage.leadingAnchor, constant: 30),
            
            dateString.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dateString.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(todo: TodoModel) {
        isCompleteImage.image = UIImage(systemName: todo.isComplete ? "checkmark.circle" : "circle")
        body.text = todo.body
        dateString.text = todo.dateString
    }
}
