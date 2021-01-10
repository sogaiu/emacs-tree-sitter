;; XXX: do not pay too much attention to the names of the @-constructs
;;      these were chosen so that they could appropriately contrast
;;      trying to select @-constructs to match the supposed meaning in
;;      emacs-tree-sitter wasn't yielding appropriate distinctions

(keyword) @type

(string) @string

(number) @number

[(boolean) (nil)] @string.special

(comment) @comment

(list
 .
 (symbol) @function
 (.match? @function "^(_G|_VERSION|arg|assert|bit32|collectgarbage|coroutine|debug|dofile|error|getfenv|getmetatable|io|ipairs|load|loadfile|loadstring|math|next|os|package|pairs|pcall|print|rawequal|rawget|rawlen|rawset|require|select|setfenv|setmetatable|string|table|tonumber|tostring|type|unpack|xpcall)$"))

(list
 .
 (symbol) @type.parameter
 (.match? @type.parameter "^(#|\\.|\\.\\.|\\.\\.\\.|:|\\^|\\*|%|/|//|-|\\+|<|<=|>|>=|=|->|-->|-?>|-?>>|λ|and|band|bnot|bor|bxor|comment|do|doc|doto|each|eval-compiler|fn|for|global|hashfn|if|import-macros|include|lambda|length|let|local|lshift|lua|macro|macrodebug|macroexpand|macros|match|not|not=|or|partial|pick-args|pick-values|quote|require-macros|rshift|set|set-forcibly!|tset|values|var|when|while|with-open)$"))
