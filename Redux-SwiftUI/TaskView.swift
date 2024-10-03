//
//  TaskView.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 26/09/24.
//

import SwiftUI

struct TaskView: View {
    
    @EnvironmentObject var store: Store<AppState>
    @State var task: String = ""
    
    struct Props {
        //Props
        let tasks: [Task]
        //Dispatch
        let onTaskAdded: (Task) -> ()
    }
    
    private func map(state: TaskState) -> Props {
        return Props(tasks: state.task) { task in
            store.dispatch(action: AddTaskAction(task: task))
        }
    }
    
    var body: some View {
        
        let props = map(state: store.state.taskState)

        VStack {
            TextField("Enter Task Here", text: $task)
                .textFieldStyle(.roundedBorder)
                .border(.gray.opacity(0.5))
                .padding()
            Button("Add Task") {
                let task = Task(title: self.task)
                props.onTaskAdded(task)
            }
            Spacer()
            
            List(props.tasks, id: \.id) { task in
                Text("\(task.title)")
            }
            
        }
    
    }
}

#Preview {
    let store = Store(reducer: appReducer, state: AppState())
    return TaskView().environmentObject(store)
}
