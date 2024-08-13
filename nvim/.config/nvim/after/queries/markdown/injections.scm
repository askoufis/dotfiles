; extends

;;
; Inject javascript into mdx files, which are actually treated as markdown files,
; so they work with Treesitter as there is currently no proper mdx parser
; https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/
;;

((inline) @injection.content
  (#lua-match? @injection.content "^%s*import")
  (#set! injection.language "typescript"))
((inline) @injection.content
  (#lua-match? @injection.content "^%s*export")
  (#set! injection.language "typescript"))
