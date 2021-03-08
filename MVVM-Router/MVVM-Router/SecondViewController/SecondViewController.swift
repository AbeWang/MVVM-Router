//
//  SecondViewController.swift
//  MVVM-Router
//
//  Created by Abe Wang on 2021/3/4.
//

import UIKit

enum SecondViewDestination {
    case sectionA
    case sectionB
}

class SecondViewController: UITableViewController {
    let kBasicCellIdentifier = "kBasicCellIdentifier"
    
    var viewModel: SecondViewModel?
    var router: SecondViewRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension SecondViewController {
    private func setupUI() {
        title = "List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kBasicCellIdentifier)
    }
}

extension SecondViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kBasicCellIdentifier, for: indexPath)
        var content = UIListContentConfiguration.cell()
        content.text = viewModel?.textForSection(indexPath.section)
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.textForSection(section)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection(section) ?? 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sectionCount ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        router?.route(to: indexPath.section == 0 ? .sectionA: .sectionB)
    }
}
