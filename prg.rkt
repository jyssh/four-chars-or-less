#lang racket

(define (remove-substr substr str)
  (string-replace str substr ""))

(define (remove-substrs substrs str)
  (foldl remove-substr str substrs))

(define (get-domain-name url)
  (define trimmed (remove-substrs '("https://" "http://" "www") url))
  (define domain-frags (string-split trimmed "."))
  (car domain-frags))

(define (4-chars-or-less? url)
  (define name (get-domain-name url))
  (<= (string-length name) 4))

(filter 4-chars-or-less? '("www.google.com" "https://stfj.net"))
