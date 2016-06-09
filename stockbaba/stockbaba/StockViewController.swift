//
//  StockViewController.swift
//  stockbaba
//
//  Created by Diana Yau on 6/8/16.
//  Copyright © 2016 hello. All rights reserved.
//

import UIKit

class StockViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var stocks: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = NSURL(string: "https://dianaapp.herokuapp.com/price?symbol=BABA")
        let request = NSURLRequest(
            URL: url!,
            cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData,
            timeoutInterval: 10)
        
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate: nil,
            delegateQueue: NSOperationQueue.mainQueue()
        )
        
        let task: NSURLSessionDataTask = session.dataTaskWithRequest(request,completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(data, options:[]) as? NSDictionary {
                    print("response: \(responseDictionary)")
                    
                    //self.stocks = responseDictionary[""] as! [NSDictionary]
                    
                    self.tableView.reloadData()
                    
                }
            }
        })
        task.resume()

        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //if movies is not null
        if let stocks = stocks {
            return stocks.count
        }
        else {
            return 0
        }
        
        //row number
    }
    
    //sets each content for each cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("StockCell", forIndexPath: indexPath) as! StockCell
        //indexPath tells us the indexPath for each cell
        
        let stock = stocks![indexPath.row]
        let nameofStock = stock["full_name"] as! String
        let open = stock["open_price"] as! String
        let close = stock["close_price"] as! String
        
        /*
         var billAmount = NSString(string: billField.text!).doubleValue
         var tip = billAmount * tipPercentage
         var total = billAmount + tip
         
         tipLabel.text = "$\(tip)"
         totalLabel.text = "$\(total)"
         
         tipLabel.text = String(format: "$%.2f", tip)
         totalLabel.text = String(format: "$%.2f", total)
 
    */
        
        
        cell.titleStock.text = nameofStock
        cell.openPrice.text = open
        cell.closePrice.text = close
        
        cell.textLabel!.text = title
        print("row \(indexPath.row)")
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
