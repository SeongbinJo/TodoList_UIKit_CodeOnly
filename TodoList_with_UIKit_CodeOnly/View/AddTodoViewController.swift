//
//  AddTodoViewController.swift
//  TodoList_with_UIKit_CodeOnly
//
//  Created by 조성빈 on 5/24/24.
//

import UIKit

class AddTodoViewController: UIViewController {
    weak var delegate: AddTodoViewControllerDelegate?
    
    let cancelButton = UIButton(type: .system)
    let saveButton = UIButton(type: .system)
    let navigationBarStackView = UIStackView()
    
    var tableView = UITableView()
    
    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupTableView()
        setupButtons()
        setupStackView()
    }
    
    
    func setupButtons() {
        cancelButton.setTitle("cancel", for: .normal)
        cancelButton.addAction(UIAction { [weak self] _ in
            self?.dismiss(animated: true)
        }, for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        saveButton.setTitle("save", for: .normal)
        saveButton.addAction(UIAction { [weak self] _ in
//            TodoDataManager.manager.addTodo(newTodo: TodoModel(id: UUID(), body: self?.textField.text ?? "nil", date: Date(), isComplete: false))
            self?.delegate?.saveTodo(TodoModel(id: UUID(), body: self?.textField.text ?? "nil", date: Date(), isComplete: false))
            self?.dismiss(animated: true)
        }, for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupStackView() {
        navigationBarStackView.axis = .horizontal
        navigationBarStackView.distribution = .equalSpacing
        navigationBarStackView.alignment = .center
        
        navigationBarStackView.addArrangedSubview(cancelButton)
        navigationBarStackView.addArrangedSubview(saveButton)
        
        navigationBarStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(navigationBarStackView)
        
        NSLayoutConstraint.activate([
            navigationBarStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            navigationBarStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            navigationBarStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            navigationBarStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30)
        ])
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
    }

    
    @objc func cancelButtonTapped() {
        print("cancelButton Clicked.")
    }
    
    @objc func saveButtonTapped() {
        print("cancelButton Clicked.")
    }
}

extension AddTodoViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Todo 입력"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        textField.placeholder = "Todo"
        textField.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 5),
            textField.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -5),
            textField.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 5),
            textField.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -5),
        ])
        return cell
    }

}
