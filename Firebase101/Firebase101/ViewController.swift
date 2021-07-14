//
//  ViewController.swift
//  Firebase101
//
//  Created by 김현균 on 2021/07/14.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var numOfCustomers: UILabel!
    
    let db = Database.database().reference()

    var customers: [Customer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    func updateLabel(){
        db.child("firstdata").observeSingleEvent(of: .value) { snapshot in
            let value = snapshot.value as? String ?? ""
            
            DispatchQueue.main.async {
                self.dataLabel.text = value
            }
        }
    }
    
    @IBAction func createCustomer(_ sender: Any) {
        saveCustomers()
    }
    
    @IBAction func fetchCustomer(_ sender: Any) {
        fetchCustomers()
    }
    
    
    func deleteCustomers() {
        db.child("customers").removeValue()
    }
    
    @IBAction func deleteCustomer(_ sender: Any) {
        deleteCustomers()
    }
    
    
    func updateCustomers() {
        guard customers.isEmpty == false else { return }
        customers[0].name = "Min"
        
        let dictionary = customers.map { $0.toDictionary }
        db.updateChildValues(["customers": dictionary])
    }
    
    @IBAction func updateCustomer(_ sender: Any) {
        updateCustomers()
    }
    
    
    
}

extension ViewController {
    func saveBasicTypes() {
        // - String, number, dictionary, array
        db.child("int").setValue(3)
        db.child("double").setValue(3.5)
        db.child("str").setValue("String value - 하이하ㅣㅇ")
        db.child("array").setValue(["a", "b", "c"])
        db.child("dict").setValue(["id":"anyID", "age":10, "city": "Seoul"])
    }
    
    func saveCustomers() {
        // 책가게
        // 사용자를 저장하겠다
        // 모델 Customer + Book
        let books = [Book(title: "Good to Great", author: "Someone"), Book(title: "Hacking Growth", author: "Somebody")]
        let customer1 = Customer(id: String(Customer.id), name: "Son", books: books)
        Customer.id += 1
        let customer2 = Customer(id: String(Customer.id), name: "Dele", books: books)
        Customer.id += 1
        let customer3 = Customer(id: String(Customer.id), name: "Kane", books: books)
        Customer.id += 1
        
        db.child("customers").child(customer1.id).setValue(customer1.toDictionary)
        db.child("customers").child(customer2.id).setValue(customer2.toDictionary)
        db.child("customers").child(customer3.id).setValue(customer3.toDictionary)
    }
}

// Mark: Read(Fetch) Data
extension ViewController {
    func fetchCustomers() {
        db.child("customers").observeSingleEvent(of: .value) { snapshot in
//            print("--> \(snapshot.value)")
            do {
                let data = try JSONSerialization.data(withJSONObject: snapshot.value, options: [])
                
                let decoder = JSONDecoder()
                let customers: [Customer] = try decoder.decode([Customer].self, from: data)
                self.customers = customers
                
                DispatchQueue.main.async {
                    self.numOfCustomers.text = "customers count : \(customers.count)"
                }
            } catch let error {
                print("--> error: \(error.localizedDescription)")
            }
            
        }
    }
}

extension ViewController {
    func updateBasicTypes() {
//        db.child("int").setValue(3)
//        db.child("double").setValue(3.5)
//        db.child("str").setValue("String value - 하이하ㅣㅇ")
        
        db.updateChildValues(["int": 6, "double": 5.4, "str": "변경된 스트링"])
    }
    
    func deleteBasicTypes() {
        db.child("int").removeValue()
        db.child("double").removeValue()
        db.child("str").removeValue()
    }
}

struct Customer: Codable {
    let id: String
    var name: String
    let books: [Book]
    
    var toDictionary: [String: Any] {
        let bookArray = books.map { $0.toDictionary }
        let dict: [String: Any] = ["id": id, "name": name, "books": bookArray]
        return dict
    }
    
    static var id: Int = 0
}

struct Book: Codable {
    let title: String
    let author: String
 
    var toDictionary: [String: Any] {
        let dict: [String:Any] = ["title": title, "author": author]
        return dict
    }
}
