//
//  JournalEditorModel.swift
//  SwiftArmyKnife
//
//  Created by Jeremy Warren on 2/18/22.
//

import Foundation

class JournalEditorModel: ObservableObject {
    @Published var title = ""
    @Published var contents = ""
    
    func onAppear(entry: JournalEntry) {
        title = entry.title
        contents = entry.contents
    }
}
