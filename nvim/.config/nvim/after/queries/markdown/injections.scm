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

;;
; Injection to treat `tsx` code blocks as `typescriptreact`
; This used to work, but broke at some point, potentially after this
; PR https://github.com/nvim-treesitter/nvim-treesitter/pull/4659
;
; Combination of the nvim-treesitter markdown code block injection
; https://github.com/nvim-treesitter/nvim-treesitter/blob/f499a711fa5c573b5ba0af09a3c9955a6c14b062/queries/markdown/injections.scm#L1
; as well as this example from the treesitter docs
; https://tree-sitter.github.io/tree-sitter/syntax-highlighting#language-injection
;;
(fenced_code_block
  (info_string
    (language) @language) (#eq? @language "tsx")
  ; This is the only way I could get it to work
  ; Doing @typescript doesn't work for some reason
  (code_fence_content) @injection.content
    ; Don't think this is needed
    ; (#exclude_children! @injection.content)
    (#set! injection.language "tsx")
)
