; extends

;;
; Inject javascript into mdx files, which are actually treated as markdown files,
; so they work with Treesitter as there is currently no proper mdx parser
; https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/
;;
((inline) @_inline
  (#lua-match? @_inline "^import")) @javascript

((inline) @_inline
  (#lua-match? @_inline "^export")) @javascript

