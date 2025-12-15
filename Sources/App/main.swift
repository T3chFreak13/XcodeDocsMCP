import XcodeDocsMCPCore

@main
struct XcodeDocsMCPApp {
    static func main() async {
        let server = MCPServer()
        await server.run()
    }
}
