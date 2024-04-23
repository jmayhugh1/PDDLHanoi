(define (domain hanoi)
  (:requirements :strips :universal-preconditions :negative-preconditions :disjunctive-preconditions :conditional-effects)
  (:predicates 
    (clear ?x) 
    (on ?x ?y) 
    (smaller ?x ?y) 
    (is_disc ?x)
    (is_peg ?x)
  )
  
  (:action move
    :parameters (?disc ?from ?to )
    :precondition (and
                    (is_disc ?disc)
                    (is_peg ?from)
                    (is_peg ?to)
                    (on ?disc ?from) ; disc is on the from peg
                    (clear ?disc)      ;  disc is clear
                    ;(clear ?to)        ;  peg is clear
                    (forall (?other)  ; For all other disks it either cant be on to peg or ig it h
                      ; (or
                      ; (not (is_disc ?other))
                      ; (or
                      ;   (not (on ?other ?to))  ;  other disk is not on the to peg
                      ;   (smaller ?disc ?other) ; Or the moving disk is smaller than any disk on the to peg
                      ; )
                      
                      ; )
                    
                      (when (is_disc ?other) 
                      (or (not (on ?other ?to) (smaller ?disc ?other))))
                    )
                  )
    :effect (and
              (forall (?other) 
                
                (when (on ?disc ?other)
                  (clear ?other))  ; Clear any disc that was under the moving disc
                
              )
              (not (on ?disc ?from)) ; disc is no longer on the from peg

              (when (forall (?other) (not (on ?other ?from)))
                    (clear ?from)   ; Clear the from peg if no other discs remain
              )

              (forall (?other)
                (when (and (on ?other ?to) (clear ?other))  ; For any disc on the to peg that is clear
                  (not (clear ?other))  ; no longer clear ?
                  (on ?other ?to)
                )
              )
              (on ?disc ?to)        ; The disc is now on the to peg
              (not (clear ?to))     ; The to peg is no longer clear
              (clear ?disc)         ; The moving disc remains clear
            )
  )
)

;; move last thing from pillar

;;effect 
;; for all the discs or pillars that the disc is on, the disc is no longer on the pillar
; (and
            
;               ;; marking the disc beneath it clear
;               ;; if the disc being moved was on another disk then that disk is now clear
;               (forall (?other) 
;                 (or 
;                 (not(is_disc ?other))
;                 (when (on ?disc ?other)
;                   (clear ?other))
;                 )
;               )


;               (not (on ?disc ?from)) ; The disc is no longer on the from peg
             

;               ;; If there are no disks left on the peg from which a disk was 
;               ;; just moved (?from), then mark that peg (?from) as clear.
;               (when (forall (?other )(not (on ?other ?from)))
;                     (clear ?from)   ;; clearing the to peg
;               )

;               ;; now for every disc that is on the to peg
;               ;; and is currently clear, it is no longer clear and the disc is now on it ->>> shouldnt be more than one
;               (forall (?other - disk)
;                 (when (and (on ?other ?to) (clear ?other)) ;; if it was marked clear then it is no longer clear
;                   (not (clear ?other))
;                   (on ?other ?to)
;                 )
;               )
;               (on ?disc ?to)         ; The disc is now on the to peg
;               (not (clear ?to))      ; The to peg is no longer clear
;               (clear ?disc)         ; The disc is now clear
;             )