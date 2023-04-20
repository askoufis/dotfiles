; extends

; Disable spell checking on injected tsx within mdx files
; https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/
((inline) @_inline (#match? @_inline "^\(import\|export\)")) @nospell
