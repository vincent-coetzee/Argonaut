//
//  ViewController.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Cocoa

class PrimaryViewController: NSViewController
    {
    ///
    ///
    /// Constants are declared in the class that uses them since they need
    /// to be close to the point of use otherwise toouch time is wasted
    /// looking them from a centralized constant class. In keeping with
    /// AppKit tradition constants are all prefixed with "k" for ease
    /// of recognition.
    ///
    ///
    private static let kRequestViewIndex = 0
    private static let kResponseViewIndex = 1
    private static let kJSONViewControllerNibName = "JSONViewController"
    private static let kQueryFieldIdentifier = NSUserInterfaceItemIdentifier(rawValue: "QueryField")
    private static let kQueryCellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "QueryCell")
    private static let kTimeFieldIdentifier = NSUserInterfaceItemIdentifier(rawValue: "TimeField")
    private static let kTimeCellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "TimeCell")
    
    private var requestController: JSONViewController!
    private var responseController: JSONViewController!
    private var queries: Queries = []
    private var selectedQuery: Query?
    
    @IBOutlet var queryTableView: NSTableView!
    @IBOutlet var generateButton: NSButton!
    @IBOutlet var resultTabView: NSTabView!
    @IBOutlet var verticalSplitView: NSSplitView!
    @IBOutlet var resultTypeSegmentedControl: NSSegmentedControl!
    
    override func viewDidLoad()
        {
        super.viewDidLoad()
        self.initViews()
        }
        
    private func initViews()
        {
        self.requestController = JSONViewController(nibName: Self.kJSONViewControllerNibName, bundle: nil)
        var item = self.resultTabView.tabViewItem(at: Self.kRequestViewIndex)
        item.view = self.requestController.view
        self.responseController = JSONViewController(nibName: Self.kJSONViewControllerNibName, bundle: nil)
        item = self.resultTabView.tabViewItem(at: Self.kResponseViewIndex)
        item.view = self.responseController.view
        }
        
    @IBAction func onGenerateNewRequestClicked(_ sender: Any?)
        {
        let alert = NSAlert()
        alert.messageText = "New Random Query"
        alert.informativeText = "Would you like to generate a random query to the server ?"
        alert.addButton(withTitle: "OK")
        alert.addButton(withTitle: "Cancel")
        alert.beginSheetModal(for: self.view.window!)
            {
            response in
            alert.window.endSheet(self.view.window!)
            if response.rawValue - 1000 == 0
                {
                self.generateNewRandomRequest()
                }
            }
        }
        
    private func generateNewRandomRequest()
        {
        do
            {
            let query = try Query.makeRandomQuery()
            RemoteServer().sendQuery(query)
                {
                result in
                if case let RequestResult.success(someQuery) = result
                    {
                    self.queries.append(someQuery)
                    self.queries.sort{$0.date < $1.date}
                    DispatchQueue.main.async
                        {
                        self.queryTableView.reloadData()
                        }
                    }
                else
                    {
                    self.alertUser(ofError: result)
                    }
                }
            }
        catch let error as RequestResult
            {
            self.alertUser(ofError: error)
            }
        catch
            {
            self.alertUser(ofError: .unknownError)
            }
        }
        
    private func alertUser(ofError error: RequestResult)
        {
        let alert = NSAlert()
        alert.messageText = "Error Making Random Query"
        alert.informativeText = error.errorMessage
        alert.addButton(withTitle: "Dismiss")
        alert.beginSheetModal(for: self.view.window!)
            {
            response in
            alert.window.endSheet(self.view.window!)
            }
        }
        
    @IBAction func onViewTypeSelected(_ sender: Any?)
        {
        if self.resultTypeSegmentedControl.selectedSegment == Self.kRequestViewIndex
            {
            self.resultTabView.selectTabViewItem(at: Self.kRequestViewIndex)
            }
        else if self.resultTypeSegmentedControl.selectedSegment == Self.kResponseViewIndex
            {
            self.resultTabView.selectTabViewItem(at: Self.kResponseViewIndex)
            }
        }
        
    private func setSelectedQuery(_ query: Query)
        {
        self.selectedQuery = query
        self.requestController.json = query.request.json
        self.responseController.json = query.response?.json
        }
    }

///
/// The behaviour required of a TableViewDelegate, handle number of rows
/// and the selection of a particular row. When a row is selected, locate
/// the appropriate query and update the JSON controllers accordingly.
///
extension PrimaryViewController: NSTableViewDelegate
    {
    func numberOfRows(in tableView: NSTableView) -> Int
        {
        self.queries.count
        }
        
    func tableViewSelectionDidChange(_ notification: Notification)
        {
        let selectedRow = self.queryTableView.selectedRow
        guard selectedRow != -1 else
            {
            return
            }
        self.setSelectedQuery(self.queries[selectedRow])
        }
    }
///
/// Methods to supply data to the queries table view.
///
extension PrimaryViewController: NSTableViewDataSource
    {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?
        {
        guard row < self.queries.count else
            {
            return(nil)
            }
        guard let column = tableColumn else
            {
            return(nil)
            }
        if column.identifier == Self.kQueryFieldIdentifier,let cell = tableView.makeView(withIdentifier: Self.kQueryCellIdentifier, owner: nil) as? NSTableCellView
            {
            cell.textField?.stringValue = self.queries[row].name
            return(cell)
            }
        else if column.identifier == Self.kTimeFieldIdentifier,let cell = tableView.makeView(withIdentifier: Self.kTimeCellIdentifier, owner: nil) as? NSTableCellView
            {
            cell.textField?.stringValue = self.queries[row].dateString
            return(cell)
            }
        return(nil)
        }
    }
