# Xcode Documentation MCP Server

A local MCP (Model Context Protocol) server that provides access to Apple's developer documentation and SDK symbols directly from your Xcode installation.

## Features

- **search_documentation** - Search Apple documentation using Spotlight and SDK headers
- **get_symbol_info** - Get detailed info about a specific symbol using swift-symbolgraph-extract
- **list_frameworks** - List all available Apple frameworks in the macOS SDK
- **extract_module_symbols** - Extract all public symbols from a Swift module

## Requirements

- macOS 14.0+
- Xcode installed (with command line tools)
- Swift 6.0+

## Building

```bash
cd XcodeDocsMCP
swift build -c release
```

The binary will be at `.build/release/xcode-docs-mcp`

## Installation

### For Claude Code

Add to your `~/.claude/settings.json`:

```json
{
  "mcpServers": {
    "xcode-docs": {
      "command": "/path/to/XcodeDocsMCP/.build/release/xcode-docs-mcp"
    }
  }
}
```

### For Claude Desktop

Add to your Claude Desktop config (`~/Library/Application Support/Claude/claude_desktop_config.json`):

```json
{
  "mcpServers": {
    "xcode-docs": {
      "command": "/path/to/XcodeDocsMCP/.build/release/xcode-docs-mcp"
    }
  }
}
```

## Usage Examples

Once installed, you can ask Claude:

- "List all SwiftUI protocols"
- "What is the declaration of URLSession in Foundation?"
- "Search for NSWindow in the documentation"
- "What frameworks are available that contain 'Kit'?"

## Tools

### search_documentation

Search Apple's developer documentation.

```json
{
  "query": "NSWindow",
  "limit": 20
}
```

### get_symbol_info

Get detailed information about a symbol.

```json
{
  "module": "SwiftUI",
  "symbol": "View"
}
```

### list_frameworks

List available frameworks.

```json
{
  "filter": "Swift"
}
```

### extract_module_symbols

Extract all symbols from a module.

```json
{
  "module": "Foundation",
  "kind": "struct"
}
```

Kind options: `struct`, `class`, `enum`, `protocol`, `func`, `var`, `all`

## How It Works

1. **Spotlight Search** - Uses `mdfind` to search Xcode's documentation cache
2. **Symbol Graph Extraction** - Uses `swift-symbolgraph-extract` to get detailed Swift symbol information directly from the SDK
3. **Header Search** - Falls back to searching Objective-C headers for symbols not available via Swift
