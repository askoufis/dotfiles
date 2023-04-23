; extends

; Disable spell checking on injected tsx within mdx files
; https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/
((inline) @_inline
  (#lua-match? @_inline "^import")) @nospell

((inline) @_inline
  (#lua-match? @_inline "^export")) @nospell

