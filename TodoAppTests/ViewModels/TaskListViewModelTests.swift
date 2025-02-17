class TaskListViewModelTests: XCTestCase {
    var sut: TaskListViewModel!
    var mockService: MockTaskService!
    
    override func setUp() {
        super.setUp()
        mockService = MockTaskService()
        sut = TaskListViewModel(taskService: mockService)
    }
    
    func testFetchTasks() async {
        // Given
        let mockTask = Task(id: UUID(), title: "Test", description: "", isCompleted: false, dueDate: Date(), priority: .medium)
        mockService.mockTasks = [mockTask]
        
        // When
        await sut.fetchTasks()
        
        // Then
        XCTAssertTrue(mockService.fetchTasksCalled)
        XCTAssertEqual(sut.tasks.count, 1)
        XCTAssertEqual(sut.tasks.first?.title, "Test")
    }
} 