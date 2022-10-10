//
//  ViewController.swift
//  IOS_EVO4
//
//  Created by Plancquet Frederic on 10/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var expenseTableView: UITableView!{
        didSet {
            expenseTableView.dataSource = self
            expenseTableView.register(UINib(nibName: "expenseCell", bundle: nil), forCellReuseIdentifier: "expenseCell")
        }
    }
    @IBOutlet weak var expenseLabel: UILabel!
    @IBOutlet weak var addExpenseButton: UIButton!
    var expenses = [Expense]() 
    private let context = AppDelegate.shared.persistentContainer.viewContext

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        loadFromCoreData()
        
        
        
    }
    
    

    @IBAction func didTaptoAddExpense(_ sender: Any) {
        if let modalViewController = storyboard?.instantiateViewController(withIdentifier: "AddExpenseScreen") as? AddExpenseScreen  {
    
            modalViewController.delegate = self
            self.present(modalViewController, animated: true)
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "shopping"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as! expenseCell
        let expense = expenses[indexPath.row]
        cell.expenseLb.text = expense.name
        cell.amountLb.text = expense.value.formatCurrency()
        
        return cell
    }
    
    
    
    func loadFromCoreData() {
        
        let request = Expense.fetchRequest()
        // request.sortDescriptors
        
        do {
            expenses = try context.fetch(request)
        } catch {
            print("Can't fetch from Core Data!")
        }
    }
   
}

extension ViewController: AddExpenseScreenDelegate {
    func didAdd() {
         loadFromCoreData()
    }
}


extension Float {
    func formatCurrency() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        
        return formatter.string(from: self as NSNumber)
    }
}



