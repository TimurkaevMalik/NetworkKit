//
//  GropedTasksManager.swift
//  NetworkKit
//
//  Created by Malik Timurkaev on 19.10.2025.
//

import Foundation

@available(iOS 13.0, *)
final class GroupedTasksManager<TaskGroup: Hashable, TaskID: Hashable> {
    
    private var tasks: [TaskKey: Task<(), Never>] = [:]
    
    struct TaskKey: Hashable {
        let group: TaskGroup
        let taskID: TaskID
    }
}

@available(iOS 13.0, *)
extension GroupedTasksManager {
    func set(task: Task<(), Never>, for key: TaskKey) {
        tasks[key] = task
    }
    
    func get(for key: TaskKey) -> Task<(), Never>? {
        tasks[key]
    }
    
    func remove(for key: TaskKey) {
        tasks.removeValue(forKey: key)
    }
    
    func removeAll() {
        tasks.forEach({ $0.value.cancel() })
        tasks.removeAll()
    }
    
    func makeKey(group: TaskGroup, taskID: TaskID) -> TaskKey {
        TaskKey(group: group, taskID: taskID)
    }
}
