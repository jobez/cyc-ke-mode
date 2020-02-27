;;; * syntax
;; (note, the defvars are left without what will eventually be filled in with regexs that accomodate their description here: https://web.archive.org/web/20200205001240/http://pdkb.org/wiki/index.php/KE-Text)
;; also note, that this is probably most pleasantly displayed with outshine mode, more info here https://www.modernemacs.com/post/outline-ivy/
;;;; * notation

(defvar variables

  "variables occurring anywhere in a KE text (e.g. inside rule statements) must begin with a `?` querstion mark")
(defvar constants

  "it is not necessary to include the initial `#$` references to known constants, though it is not disallowed. for example one could use either `#$Siegel` or `Siegel`; `#$KeithsHouse` or `Keithshouse.` Accepted practice is to write KE text without the `#$` prefix")
(defvar strings
  "strings referred to in KE text (such as on the #$comment predicate for a constant) must be delimited by double quotes (e.g. \"This is a string\" as in Common Lis andd C)
KE file preserves tab and return/newline/linefeed characters that occur inside strings, but will remove any non-printing characters
")
(defvar keywords
  "keywords occurring in formulas must be prefixed with a colon `:`")
(defvar symbols
  "symbols occurring in formulates must be prefixed with a single quote
f: (afterAdding genls 'GENLS-AFTER-ADDING).")

;;;; * expressions

;;  <directive>: <data-object-or-object-sequence>.

;;;; * directives

;; two types of objects that may fill the position in a
;; KE text expression:
;; reserved words and predicates

;;;;;; * reserve words
;;;;;;;;; * Constant
;;;;;;;;; * In MT

;; When an expression beginning with an In Mt  directive is evaluated, it causes the default entry microtheory to be set to the named microtheory. This setting persists until the next occurrence of an In Mt directive, a Default Mt or a Constant MT


;;;;;;;;; * Default MT
;;;;;;;;; * Truth Value (TV)

;; data object following the colon delimiter must be one of the keywords :default, :monotonic, or :unknown [ok to omit the colon]

;;;;;;;;; * Direction (or D)

;; keywords :forward (to indicate forward prop)
;; :backward (to indicate backward prop)
;; :unknown


;;;;;;;;; * Formula
;;;;;;;;; * Enter

;; enter and delete have the following syntax

;; <reserve-word>.


;;;;;;;;; * Delete


;; enter and delete have the following syntax
;; delete reserve word indicates that all expressions below it (until meeting an enter reserve word) should be removed from the Cyc KB

;; <reserve-word>.



;;;;;;;;; * Rename

;; <reserve-word> <old-constant-name>

;;;;;;;;; * Kill
;;;;;;;;; * Include



;;;;;; * General Reserve Wprds
;; the syntax for all reserve wwords except `Enter`, `Delete` and `Rename` is the same.
;; Each reserve word os followed by a colon delimiter, exactly one data object, and a period.
;; that is, the form of a reserve word expression in KE Text syntax is

;; <reserve-word>: <data-object>.


;; reserve word directive names are not case sensitive.
;; for example, "constant" works just as well as "Constant"






;;;;;; * Enter and Delete


;;;;;; * Rename



;;;; * Predicate Directives
;;;; * Special Handling for TheAssertionSentence
;;;; * Comments in KE Text
;;;; * Order of Expressions
;;;; * Another Example
;;;; * Processing KE Text in the Cyc Web Interface
;;;; * Loading KE Test File from a Console Interactor


;;; * Appendix A: KE Text History
;;;; * Appendix B: KE Text Syntax


(require 'ov)

(with-current-buffer (get-buffer-create "kefscratch")
  (ov-set (rx (and line-start
                   (one-or-more alnum)
                   (zero-or-more " ")
                   (zero-or-more alnum)
                   )
              ":")
          'face '(:box t))
  (ov-set (rx ?# ?$ (* alnum))
          'face '(:foreground "yellow")))
