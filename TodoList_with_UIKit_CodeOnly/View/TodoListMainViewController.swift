//
//  TodoListMainViewController.swift
//  TodoList_with_UIKit_CodeOnly
//
//  Created by 조성빈 on 5/24/24.
//

import UIKit

class TodoListMainViewController: UIViewController, AddTodoViewControllerDelegate {
    private lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationItem.title = "Todo main view"
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.backgroundColor = .systemCyan
        
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance

        let addTodoButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodoButtonTapped))
        addTodoButton.tintColor = .white
        self.navigationItem.rightBarButtonItems = [addTodoButton]
        
        setupTableView()
        
        TodoDataManager.manager.loadTodos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @objc func addTodoButtonTapped() {
        print("addTodoButton Clicked.")
        let addTodoViewController = AddTodoViewController()
        addTodoViewController.delegate = self
        present(addTodoViewController, animated: true)
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
    }
    
    func saveTodo(_ todo: TodoModel) {
        TodoDataManager.manager.addTodo(newTodo: todo)
        TodoDataManager.manager.saveTodos()
        tableView.reloadData()
    }
    
}


extension TodoListMainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TodoDataManager.manager.countOfTodoList()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoListTableViewCell
        cell.configure(todo: TodoDataManager.manager.getTodo(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTodo = TodoDataManager.manager.getTodo(index: indexPath.row)
        TodoDataManager.manager.changeIsComplete(todo: selectedTodo)
        TodoDataManager.manager.saveTodos()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            TodoDataManager.manager.removeTodo(index: indexPath.row)
            
            // 테이블 뷰에서 행 삭제
            tableView.deleteRows(at: [indexPath], with: .automatic)

            TodoDataManager.manager.saveTodos()
        }
    }
}
