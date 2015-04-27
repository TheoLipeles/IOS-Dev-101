//
//  NewMovieViewController.swift
//  MovieTheaterApp
//
//  Created by Theodore Lipeles on 3/11/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import UIKit
import CoreData

class NewMovieViewController: UIViewController {


    
    var coreDataStack = (UIApplication.sharedApplication().delegate as AppDelegate).coreDataStack
    
    @IBOutlet weak var movieTitleTextField: UITextField!
    
    @IBAction func saveMovie(sender: AnyObject) {
        
        let entityMovie = NSEntityDescription.entityForName("Movie", inManagedObjectContext: coreDataStack.context)
        let entityDirector = NSEntityDescription.entityForName("Director", inManagedObjectContext: coreDataStack.context)
        let entityTheater = NSEntityDescription.entityForName("Theater", inManagedObjectContext: coreDataStack.context)
        
        let movie = Movie(entity: entityMovie!, insertIntoManagedObjectContext: coreDataStack.context)
        
        movie.movieTitle = movieTitleTextField.text
        
        let director = Director(entity: entityDirector!, insertIntoManagedObjectContext:coreDataStack.context)

        let theater = Theater(entity: entityTheater!, insertIntoManagedObjectContext:coreDataStack.context)
        
        director.fullName = "Theo Lipeles"
        theater.theaterName = "AMC"
        theater.location = "NYC"
        
        movie.movieTitle = movieTitleTextField.text
        movie.director = director
        movie.theaters = NSSet(array: [theater])
        
        coreDataStack.saveContext()
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
