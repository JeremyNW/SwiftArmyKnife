//
//  TodoList.swift
//  SwiftArmyKnife
//
//  Created by Jeremy Warren on 3/5/22.
//

import SwiftUI

struct TodoList: View {
    @StateObject var model = TodoListModel()
    @SectionedFetchRequest<Bool, Todo> (
        sectionIdentifier: \.isComplete,
        sortDescriptors: [SortDescriptor(\.name)],
        predicate: nil,
        animation: .default
    ) var sectionTodos: SectionedFetchResults<Bool, Todo>
    
//    @FetchRequest<Todo>(
//        sortDescriptors: [SortDescriptor(\.name)],
//        predicate: nil,
//        animation: nil
//    ) var todos: FetchedResults<Todo>
    
    var body: some View {
        VStack {
            HStack {
                TextField("What do you need to do?", text: $model.todoName)
                Button(action: {
                    model.createNewTodo()
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .padding()
            List {
                ForEach(sectionTodos) { section in
                    Section(header: Text(section.id ? "Complete" : "Incomplete")) {
                        ForEach(section) { todo in
                            todoRow(todo)
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                            let todo = section[index]
                            TodoListStorage.shared.delete(todo)
                            }
                        }
                    }
                    
                }
            }
        }
        .navigationTitle("Todoey")
    }
    
    func todoRow(_ todo: Todo) -> some View {
        Button(action: {
            todo.isComplete.toggle()
            TodoListStorage.shared.save()
        }, label: {
            Label(
                todo.name ?? "",
                systemImage: todo.isComplete ? "checkmark.square" : "square"
            )
        })
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}
