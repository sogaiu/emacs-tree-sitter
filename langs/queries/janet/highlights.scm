;; XXX: do not pay too much attention to the names of the @-constructs
;;      these were chosen so that they could appropriately contrast
;;      trying to select @-constructs to match the supposed meaning in
;;      emacs-tree-sitter wasn't yielding appropriate distinctions

;; XXX: want to distinguish between macros (+ special forms) and functions

;; @type.parameter <- @function.macro
;; @ <- @constant.builtin
;; @function <- @function.builtin

;; XXX: possible to appropriately color parameters in defs?

;; XXX: are these worth doing as special cases like this?
((keyword) @keyword
 (.match? @keyword "^(:args|:err\\-color|:exit|:exit\\-value|:headerpath|:macro\\-form|:pretty\\-format|:syspath)$"))

(keyword) @type

[(str_literal)
 (long_str_literal)
 (buffer_literal)
 (long_buffer_literal)] @string

(number_literal) @number

[(bool_literal)
 (nil_literal)] @string.special

(line_comment) @comment

[(variadic_marker)
 (optional_marker)
 (keys_marker)] @property

(def
  "def" @type.parameter
  name: (symbol) @function.builtin)

(var
  "var" @type.parameter
  name: (symbol) @function.builtin)

(quote
  "quote" @type.parameter)

(splice
  "splice" @type.parameter)

(quasiquote
  "quasiquote" @type.parameter)

(unquote
  "unquote" @type.parameter)

(break
  "break" @type.parameter)

(set
  "set" @type.parameter)

(if
  "if" @type.parameter)

(do
  "do" @type.parameter)

(while
  "while" @type.parameter)

(fn
  "fn" @type.parameter
  name: (symbol) @function.builtin)

(fn
  "fn" @type.parameter)

(upscope
  "upscope" @type.parameter)

(parameters
 parameter: (symbol) @function.builtin)

;; XXX: repetitive
(extra_defs
  "defn" @type.parameter
  name: (symbol) @function.builtin)

(extra_defs
  "defn-" @type.parameter
  name: (symbol) @function.builtin)

(extra_defs
  "varfn" @type.parameter
  name: (symbol) @function.builtin)

(extra_defs
  "varfn-" @type.parameter
  name: (symbol) @function.builtin)

(extra_defs
  "defmacro" @type.parameter
  name: (symbol) @function.builtin)

(extra_defs
  "defmacro-" @type.parameter
  name: (symbol) @function.builtin)

((symbol) @string.special
 (.match? @string.special "^(debugger\\-env|default\\-peg\\-grammar|janet/build|janet/config\\-bits|janet/version|load\\-image\\-dict|make\\-image\\-dict|module/cache|module/loaders|module/loading|module/paths|root\-env|stderr|stdin|stdout)$"))

;; some of: (keep (fn [x] (when ((dyn x) :macro) x)) (all-bindings))
(tuple
  .
  (symbol) @function
  (.match? @function "^(\\*|\\+|\\-|/|<|<=|=|>|>=|_|\\.break|\\.breakall|\\.bytecode|\\.clear|\\.clearall|\\.disasm|\\.fiber|\\.fn|\\.frame|\\.next|\\.nextc|\\.ppasm|\\.signal|\\.slot|\\.slots|\\.source|\\.stack|\\.step|abstract\\?|accumulate|accumulate2|all|all\\-bindings|all\\-dynamics|any\\?|apply|array\\?|array/concat|array|array/ensure|array/fill|array/insert|array/new|array/new-filled|array/peek|array/pop|array/push|array/remove|array/slice|array/trim|asm|assert|bad\\-compile|bad\\-parse|band|blshift|bnot|boolean\\?|bor|brshift|brunshift|buffer|buffer/bit|buffer/bit-clear|buffer/bit-set|buffer/bit-toggle|buffer/blit|buffer/clear|buffer/fill|buffer/format|buffer/new\\-filled|buffer/popn|buffer/push|buffer/push\\-byte|buffer/push\-string|buffer/push\\-word|buffer/slice|buffer/trim|buffer\\?|bxor|bytes\\?|cancel|cfunction\\?|cli\\-main|cmp|comp|compare|compare<|compare<=|compare=|compare>|compare>=|compile|complement|count|curenv|debug|debug/arg-stack|debug/break|debug/fbreak|debug/lineage|debug/stack|debug/stacktrace|debug/step|debug/unbreak|debug/unfbreak|dec|deep=|deep\\-not=|defglobal|describe|dictionary\\?|disasm|distinct|doc\\*|doc\\-format|dofile|drop|drop\\-until|drop\\-while|dyn|eflush|empty\\?|env\\-lookup|eprin|eprinf|eprint|eprintf|error|errorf|ev/call|ev/close|ev/capacity|ev/chan|ev/chunk|ev/close|ev/count|ev/deadline|ev/full|ev/give|ev/go|ev/read|ev/rselect|ev/select|ev/sleep|ev/take|ev/write|eval|eval\\-string|even\\?|every\\?|extreme|false\\?|fiber/can\\-resume\\?|fiber/current|fiber/getenv|fiber/maxstack|fiber/new|fiber/root|fiber/setenv|fiber/setmaxstack|fiber/status|fiber\\?|file/close|file/flush|file/open|file/popen|file/read|file/seek|file/temp|file/write|filter|find|find\\-index|first|flatten|flatten\\-into|flush|freeze|frequencies|function\\?|gccollect|gcinterval|gcsetinterval|gensym|get|get\\-in|getline|hash|idempotent\\?|identity|import\\*|in|inc|index\\-of|indexed\\?|int/s64|int/u64|int\\?|interleave|interpose|invert|juxt\\*|keep|keys|keyword|keyword/slice|keyword\\?|kvs|last|length|load\\-image|macex|macex1|make\\-env|make\\-image|map|mapcat|marshal|math/\\-inf|math/abs|math/acos|math/acosh|math/asin|math/asinh|math/atan|math/atan2|math/atanh|math/cbrt|math/ceil|math/cos|math/cosh|math/e|math/erf|math/erfc|math/exp|math/exp2|math/expm1|math/floor|math/gamma|math/hypot|math/inf|math/int\\-max|math/int\\-min|math/int32\\-max|math/int32\\-min|math/log|math/log10|math/log1p|math/log2|math/nan|math/next|math/pi|math/pow|math/random|math/rng|math/rng\\-buffer|math/rng\\-int|math/rng\\-uniform|math/round|math/seedrandom|math/sin|math/sinh|math/sqrt|math/tan|math/tanh|math/trunc|max|mean|merge|merge\\-into|merge\\-module|min|mod|module/add\\-paths|module/expand\\-path|module/find|nan\\?|nat\\?|native|neg\\?|net/accept|net/accept\\-loop|net/address|net/chunk|net/close|net/connect|net/flush|net/listen|net/read|net/recv\\-from|net/send\\-to|net/server|net/write|next|nil\\?|not|not=|number\\?|odd\\?|one\\?|os/arch|os/cd|os/chmod|os/clock|os/cryptorand|os/cwd|os/date|os/dir|os/environ|os/execute|os/exit|os/getenv|os/link|os/lstat|os/mkdir|os/mktime|os/open|os/perm\\-int|os/perm\\-string|os/pipe|os/proc\\-kill|os/proc\\-wait|os/readlink|os/realpath|os/rename|os/rm|os/rmdir|os/setenv|os/shell|os/sleep|os/spawn|os/stat|os/symlink|os/time|os/touch|os/umask|os/which|pairs|parse|parser/byte|parser/clone|parser/consume|parser/eof|parser/error|parser/flush|parser/has\\-more|parser/insert|parser/new|parser/produce|parser/state|parser/status|parser/where|partial|partition|peg/compile|peg/find|peg/find\\-all|peg/match|peg/replace|peg/replace\\-all|pos\\?|postwalk|pp|prewalk|prin|prinf|print|printf|product|propagate|put|put\\-in|quit|range|reduce|reduce2|repl|require|resume|return|reverse|reverse!|run\\-context|scan\\-number|setdyn|signal|slice|slurp|some|sort|sort\\-by|sorted|sorted\\-by|spit|string|string/ascii\\-lower|string/ascii\\-upper|string/bytes|string/check\\-set|string/find|string/find\\-all|string/format|string/from\\-bytes|string/has\\-prefix\\?|string/has\\-suffix\\?|string/join|string/repeat|string/replace|string/replace\\-all|string/reverse|string/slice|string/split|string/trim|string/triml|string/trimr|string\\?|struct|struct\\?|sum|symbol|symbol/slice|symbol\\?|table|table/clone|table/getproto|table/new|table/rawget|table/setproto|table/to-struct|table\\?|take|take\\-until|take\\-while|tarray/buffer|tarray/copy\\-bytes|tarray/length|tarray/new|tarray/properties|tarray/slice|tarray/swap\\-bytes|thread/close|thread/current|thread/exit|thread/new|thread/receive|thread/send|trace|true\\?|truthy\\?|tuple|tuple/brackets|tuple/setmap|tuple/slice|tuple/sourcemap|tuple/type|tuple\\?|type|unmarshal|untrace|update|update\\-in|values|varglobal|walk|xprin|xprinf|xprint|xprintf|yield|zero\\?|zipcoll)$"))

;; (keep (fn [x] (when ((dyn x) :macro) x)) (all-bindings))
(tuple
  .
  (symbol) @type.parameter
  (.match? @type.parameter "^(\\+\\+|\\+=|\\-\\-|\\->|\\->>|\\-\\?>|\\-\\?>>|\\-=|\\*=|/=|%=|and|as\\->|as\\?\\->|case|chr|comment|compif|comptime|compwhen|cond|coro|def\\-|default|defer|doc|each|eachk|eachp|eachy|edefer|ev/spawn|ev/with-deadline|for|forever|forv|generate|if-let|if-not|if-with|import|juxt|label|let|loop|match|or|prompt|protect|repeat|seq|short-fn|tracev|try|unless|use|var\\-|when|when-let|when-with|with|with-dyns|with-syms|with-vars)$"))

;; XXX: seems to highlight in addition to stuff above...that leads to bold face?
;; XXX: do not know how to distinguish between function and macro call here
;(tuple
; .
; (symbol) @function.call)

;; XXX: hack for things that might be from "elsewhere"
((symbol) @property
 (.match? @property "^.*/.*$"))
