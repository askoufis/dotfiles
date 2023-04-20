; extends

;;
; Injection to treat `ts` code blocks as `typescript`
; nvim-treesitter doesn't understand `ts` code blocks, but does understand `typescript` code blocks
;
; Combination of the nvim-treesitter markdown code block injection
; https://github.com/nvim-treesitter/nvim-treesitter/blob/f499a711fa5c573b5ba0af09a3c9955a6c14b062/queries/markdown/injections.scm#L1
; as well as this example from the treesitter docs
; https://tree-sitter.github.io/tree-sitter/syntax-highlighting#language-injection
;;
(fenced_code_block
  (info_string
    (language) @language) (#eq? @language "ts")
  ; This is the only way I could get it to work
  ; Doing @typescript doesn't work for some reason
  (code_fence_content) @injection.content
    ; Don't think this is needed
    ; (#exclude_children! @injection.content)
    (#set! injection.language "typescript")
)

;;
; Inject javascript into mdx files, which are actually treated as markdown files,
; so they work with Treesitter as there is currently no proper mdx parser
; https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/
;;
((inline) @_inline (#match? @_inline "^\(import\|export\)")) @javascript

