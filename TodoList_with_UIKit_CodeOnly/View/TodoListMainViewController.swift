//
//  TodoListMainViewController.swift
//  TodoList_with_UIKit_CodeOnly
//
//  Created by 조성빈 on 5/24/24.
//

import UIKit

class TodoListMainViewController: UIViewController {
    var sampleTodoList: SampleTodoListData = SampleTodoListData()
    
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
        
        // 더미 데이터 생성
        sampleTodoList.createSampleTodoData()

        let addTodoButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodoButtonTapped))
        addTodoButton.tintColor = .white
        self.navigationItem.rightBarButtonItems = [addTodoButton]
        
        setupTableView()
    }
    
    @objc func addTodoButtonTapped() {
        print("addTodoButton Clicked.")
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
    }
    
}


extension TodoListMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sampleTodoList.sampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoListTableViewCell
        cell.configure(todo: sampleTodoList.sampleList[indexPath.row])
        return cell
    }
    
    
}
