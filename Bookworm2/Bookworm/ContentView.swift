//
//  ContentView.swift
//  Bookworm
//
//  Created by Eman on 11/14/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students:
    FetchedResults<Student>

    var body: some View {
 
        VStack {
            List {
                // Error
                ForEach(students, id: \.id ){student in
                    Text(student.name ?? "Unknown")
                }
            }
            Button("Add"){
                let firstNames = ["oiw","nianoi","mlsmal","kld"]
                let lastNames = ["nkf","lkd","nsi","fnkdfk"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                let student = Student(context: self.moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? self.moc.save()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
