import Testing

@Suite
struct DemoTest {
    @Test
    func example() {
        #expect(1 + 1 == 2)
    }
}
