; Generic injections for use in all ecmascript filetypes
; I think calling this folder `ecma` caused issues with inheritance
; because nvim-treesitter contains its own `ecma` injections
; and I guess you can't inherit from both at once or something

; Also seems like you can't have query folder names with capitals
; or hyphens in them

; Modified from https://github.com/nvim-treesitter/nvim-treesitter/blob/f499a711fa5c573b5ba0af09a3c9955a6c14b062/queries/ecma/injections.scm#L81
(
  (comment) @_ts_comment (#eq? @_ts_comment "/* ts */")
  (template_string) @typescript (#offset! @typescript 0 1 0 -1)
)

(
  (comment) @_tsx_comment (#eq? @_tsx_comment "/* tsx */")
  (template_string) @tsx (#offset! @tsx 0 1 0 -1)
)

(
  (comment) @_html_comment (#eq? @_html_comment "/* html */")
  (template_string) @html (#offset! @html 0 1 0 -1)
)
