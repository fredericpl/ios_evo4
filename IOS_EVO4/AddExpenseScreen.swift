//
//  AddExpenseScreen.swift
//  IOS_EVO4
//
//  Created by Plancquet Frederic on 10/10/2022.
//
import CoreData
import UIKit

protocol AddExpenseScreenDelegate: AnyObject {
    func didAdd()
}

class AddExpenseScreen: UIViewController {
    
    
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var sectionTableView: UITableView! 
    @IBOutlet weak var datePicker: UIDatePicker! {
    didSet {
        datePicker.datePickerMode = .date
            }
}
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var newProductTxField: UITextField!
    @IBOutlet weak var amountNewProductTxField: UITextField!
    
    var delegate: AddExpenseScreenDelegate?
    private let context = AppDelegate.shared.persistentContainer.viewContext
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
        
        
    }
    @IBAction func didTapOnSave(_ sender: Any) {
        
        let newExpense = Expense(context: context)
        newExpense.name = newProductTxField.text
        let value = Float(amountNewProductTxField.text!)
        newExpense.value = value!
        newExpense.date = datePicker.date
        commitData()
        
        delegate?.didAdd()
        
        
        amountNewProductTxField.text = ""
        newProductTxField.text = ""
       
    }
    
    func commitData() {
        do {
            try context.save()
        } catch {
            print("Can't save to Core Data!")
            context.rollback()
        }
    }
    


}
