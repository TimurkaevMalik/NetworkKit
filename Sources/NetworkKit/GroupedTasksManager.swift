//
//  GroupedTasksManager.swift
//  NetworkKit
//
//  Created by Malik Timurkaev on 19.10.2025.
//

import Foundation

public final class GroupedTasksManager<TaskGroup: Hashable, TaskID: Hashable> {
    
    private var tasks: [TaskKey: Task<(), Never>] = [:]
    
    public struct TaskKey: Hashable {
        public let group: TaskGroup
        public let taskID: TaskID
    }
    
    public init() {}
}

public extension GroupedTasksManager {
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
