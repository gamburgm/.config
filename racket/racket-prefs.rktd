(
 (readline-input-history
  (
   #"(barfoo 6 5)"
   #"(foobar 5 6)"
   #"(define-syntax (foobar stx)\n    (syntax-parse stx\n      [(foobar x y) #'(+ x y)]\n      [(barfoo x y) #'(- x y)]))"
   #"(require (for-syntax syntax/parse racket/base))"
   #"(require syntax/parse)"
   #"(definee-syntax (foobar stx)"
   #"(instantiate-linklet y '() x)"
   #"y"
   #"(define y (compile-linklet '(linklet () () 5)))"
   #"x"
   #"(define x (instantiate-linklet (compile-linklet '(linklet () () 5)) '()))"
   #"(instantiate-linklet (compile-linklet '(linklet () () 5)) '())"
   #"(compile-linklet '(linklet () () 5))"
   #"(require racket/linklet)"
   #"(foobar '(5))"
   #"(define (foobar x) (match x [(list-rest x ... y) (cons y x)]))"
   #"(apply append '((a) (b) (c)))"
   #"(flatten x)"
   #"(concat x)"
   #"(append x)"
   #"(define x '((a) (b) (c)))"
   #"(cadddr x)"
   #"(cadr x)"
   #"(car x)"
   #"(define x (read p))"
   #"(define p (open-input-file \"foobar.rktl\"))"
   #"(match (cons 'a 'b)\n    [(list-rest x ... y) #:when (null? x) (displayln (null? x)) (displayln x) (displayln y) (displayln \"foo\")]\n    [(list-rest x ... y) #:when (null? y) (displayln \"bar\")]\n    [(list-rest x ... y) (displayln \"foobar\")])"
   #"(match (cons 'a 'b)\n    [(list-rest x ... y) #:when (null? x) (displayln (null? x)) (displayln x) (displayln \"foo\")]\n    [(list-rest x ... y) #:when (null? y) (displayln \"bar\")]\n    [(list-rest x ... y) (displayln \"foobar\")])"
   #"(match (cons 'a 'b)\n    [(list-rest x ... y) #:when (null? x) (displayln (null? x)) (displayln \"foo\")]\n    [(list-rest x ... y) #:when (null? y) (displayln \"bar\")]\n    [(list-rest x ... y) (displayln \"foobar\")])"
   #"(match (cons 'a 'b)\n    [(list-rest x ... y) #:when (null? x) (displayln \"foo\")]\n    [(list-rest x ... y) #:when (null? y) (displayln \"bar\")]\n    [(list-rest x ... y) (displayln \"foobar\")])"
   #"(match (cons 'a 'b) [(list-rest x ... y) (displayln x) (displayln (null? x))])"
   #"(match (cons 'a 'b)\n    [(list-rest x ... y) #:when (null? x) y])"
   #"(formals->absyn (cons 'a 'b))"
   #"(match (cons 'a 'b) [(list-rest x ... y) (displayln (null? x)) (displayln (null? y))])"
   #"(match (cons 'a 'b) [(list-rest x ... y) (list x y)])"
   #"(match (cons 'a 'b) [(list-rest x ... y) y])"
   #"(match '() [(list-rest x ... y) (null? y)])"
   #"(formals->absyn '())"
   #"(define (formals->absyn formals)\n    (match formals\n      [(list-rest x ... y) #:when (null? x) y]\n      [(list-rest x ... y) #:when (null? y) x]\n      [(list-rest x ... y) (list x y)]))"
   #"(match '()) [(list-rest x ... y) (null? x)])"
   #"(eq? 'foo 'foo)"
   #"(cons (list 'x 'y) (list 'foo 'bar))"
   #"(cons 'x 'y)"
   #"syntax->datum"
   #"stx->datum"
   #"false?"
   #"t?"
   #"(boolean? #t)"
   #"(true? #t)"
   #"null"
   #"(empty? '())"
   #"(null? '())"
   #"(make-hash-eq)"
   #"(make-hash-eqv)"
   #"(letrec ([f (lambda (x) (if (h (g x)) (add1 x) (sub1 x)))]\n           [g (lambda (y) (let ([x 5]) (h 5) (if (zero? x) y (g (sub1 y)))))]\n           [h (lambda (z) #t)])\n    (f 5))"
   #"(letrec\n  )"
   #"letrec"
   #"(phase1-eval         (remove-unused-vars/rel\n            (generate-prog\n            (ir-rel ((~binders a))\n              (fresh ((~binders x y))\n                (== (#%lv-ref x) (#%lv-ref a)))))))"
   #"(require (for-syntax \"unit-test-infra.rkt\" \"private/compile/remove-unused-vars.rkt\"))"
   #"(require \"private/compile/remove-unused-vars.rkt\")"
   #"(phase1-eval (define prog (generate-prog (ir-rel ((~binders a))\n              (fresh ((~binders x y))\n                (== (#%lv-ref x) (#%lv-ref a))))))\n    (displayln prog)\n    (displayln (remove-unused-vars/rel prog)))"
   #"(require syntax/macro-testing)"
   #"(require \"private/syntax-classes.rkt\")"
   #"(require (for-syntax racket/base))"
   #"(require \"private/forms.rkt\")"
   #"(require \"unit-test-infra.rkt\")"
   #"(hash-ref x 5 #f)"
   #"(hash-ref x 5)"
   #"(define x (hash))"
   #"(empty? (cons 3 5))"
   #"(empty? 5)"
   #"(abstract)"
   #"(struct abstract ())"
   #"abstract"
   #"(run 1 (q) (pluso 5 3 q))"
   #"(require \"faster-miniKanren/numbers.rkt\")"
   #"(require minikanren)"
   #"pluso"
   #"(run 1  (r s q) (pluso r s q))"
   #"(run1  (r s q) (pluso r s q))"
   #"(run* (q) (pluso '() '(1 1) q))"
   #"(require \"../faster-miniKanren/numbers.rkt\")"
   #"(require \"~/faster-miniKanren/numbers.rkt\")"
   #"(set-subtract x-st bads)"
   #"(define bads\n    (for*/set ([e1 x-st]\n               [e2 x-st]\n               #:when (and (not (equal? e1 e2)) (subset? e1 e2)))\n\n      e2))"
   #"(length bads"
   #"bads"
   #"(define bads\n    (for*/set ([e1 x-st]\n               [e2 x-st]\n               #:when (and (not (equal? e1 e2)) (subset? e1 e2)))\n\n      e1))"
   #"(set-count bads)"
   #"(length bads)"
   #"(define bads\n    (for*/set ([e1 x-st]\n               [e2 x-st]\n               #:when (subset? e1 e2))\n\n      e2))"
   #"(define bads\n    (for*/set ([e1 x-st]\n               [e2 x-st]\n               #:when (subset? e1 e2))\n      (if (< (set-count e1) (set-count e2)) e1 e2)))\n "
   #"(define bads\n    (for*/set ([e1 x-st]\n               [e2 x-st]\n               #:when (= (min (set-count e1) (set-count e2))\n                         (set-count (set-intersect e1 e2))))\n      (if (< (set-count e1) (set-count e2)) e1 e2)))\n  "
   #"(define bads\n    (for*/set ([e1 x-st]\n               [e2 x-st]\n               #:when (= (min (set-count e1) (set-count e2))\n                         (set-count (set-intersect e1 e2)))\n      (if (< (set-count e1) (set-count e2)) e1 e2)))\n  )"
   #"(define bads\n    (for*/set ([e1 x-st]\n               [e2 x-st])"
   #"x-st"
   #"(set-count x-st)"
   #"(define x-st (list->set (map list->set x)))"
   #"(length x)"
  ))
)
