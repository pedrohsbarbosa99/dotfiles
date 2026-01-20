def servers():
    return [
        ["pyright-langserver", "--stdio"],
        ["ruff", "server"],
        ["typos-lsp"],
        ["pytest-language-server"],
    ]
