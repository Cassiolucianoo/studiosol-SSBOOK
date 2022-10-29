//
//  AllBooksViewController.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 29/10/22.
//

import Foundation
import UIKit

protocol UpdateScrollViewProtocol: AnyObject {
    func updateHeight(height: CGFloat)
}

class AllBooksViewController: UIViewController {
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var heightDelegate: UpdateScrollViewProtocol?
    weak var alertDelegate: ShowAlertProtocol?
    private let allBooksVM = AllBooksViewModel()
    

override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
   // tableView.delegate = self
    
    tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "Book")
    
    self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    
    getAllBooks()
}

private func getAllBooks() {
    allBooksVM.getAllBooks { [weak self] (error) in
        if let error = error {
            guard let alert = self?.fetchAlert(title: "Erro ao carregar lista de livros", message: error) else {return}
            self?.alertDelegate?.alert(alert)
        } else {
            self?.tableView.reloadData()
            guard let newHeight = self?.tableView.contentSize.height else { return }
            self?.tableViewHeight.constant = newHeight
            self?.heightDelegate?.updateHeight(height: newHeight)
        }
    }
}

}

extension AllBooksViewController: UITableViewDataSource {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return allBooksVM.numberOfRows
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Book", for: indexPath) as? BookTableViewCell else {
        return UITableViewCell()
    }
    
    let book = allBooksVM.modelAt(indexPath.row)
    cell.bookCellVM = BookCellViewModel(book)
    
    cell.configure()
    
    return cell
}
}

//extension AllBooksViewController: UITableViewDelegate {
//
//func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    guard let dvc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else { return }
//
//    let book = allBooksVM.modelAt(indexPath.row)
//    dvc.detailVM = DetailBookViewModel(book: book)
//
//    navigationController?.pushViewController(dvc, animated: true)
//}
//}




