(use-modules (guix packages) (guix download) (guix build-system gnu))

(define-public avion
  (package
    (name "avion")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tomasmartingrinberg-cpu/dc/archive/v" version ".tar.gz"))
              (sha256 (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments '(#:tests? #f #:make-flags (list (string-append "PREFIX=" %output))))
    (inputs `(("bash" ,bash) ("ncurses" ,ncurses)))
    (synopsis "Avion ASCII animado")
    (description "Script de animacion para terminal.")
    (home-page "https://github.com/tomasmartingrinberg-cpu/dc")
    (license #f)))
