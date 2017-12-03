//
//  CoffeeShopViewController.swift
//  Coffee Shop
//
//  Created by Amadeu Cavalcante Filho on 12/3/17.
//  Copyright © 2017 Amadeu Cavalcante Filho. All rights reserved.
//

import UIKit
import CoreData

class CoffeeShopViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var products: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "The list of Products"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Product")
        
        do {
            products = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch product. \(error) \(error.userInfo)")
        }
    }

    @IBAction func addProduct(_ sender: Any) {
        let alert = UIAlertController(title: "New Product", message: "Add a new Product", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            
            guard let textField = alert.textFields?.first,
                let productToSave = textField.text else {
                    return
            }
            self.save(name: productToSave)
            self.tableView.reloadData()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "Product",
                                       in: managedContext)!
        
        let product = NSManagedObject(entity: entity,
                                      insertInto: managedContext)
        product.setValue(name, forKeyPath: "name")
        do {
            try managedContext.save()
            self.products.append(product)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

extension CoffeeShopViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = product.value(forKey: "name") as? String
        return cell
    }
}
