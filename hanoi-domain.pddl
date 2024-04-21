;; The Towers of Hanoi problem (formalisation by Hector Geffner).

(define (domain hanoi)
  (:requirements :strips)
  (:predicates (clear ?x) (on ?x ?y) (smaller ?x ?y)
  (is_disc ?x) (is_pillar ?y)
  )

  (:action move
    :parameters (?disc ?from ?to)
    :precondition (and (is_disc ?disc)  ;; is the thing moving a disc
                  (or(is_pillar ?from) (is_disc ?from)   ;; is the thing moving from a pillar or a disk
                  (or(is_pillar ?to) (is_disc ?to))  ;; is the thing moving to a pillar or a disk
                  (or(is_pillar ?to) (smaller ?disc ?to))   ;; is the thing moving to a pillar or is the disk smaller
                  (on ?disc ?from)   ;; is the disc actually on the from pillar
                  (clear ?disc) ;; is the thing you are moving clear
                  (clear ?to))) ;; is the thing you are moving to clear


                  
  :effect         (and (clear ?from)  ;; now from is clear
                  (on ?disc ?to)  ;; now disc is on to
                  (not (on ?disc ?from))  ;; now disc is not not on from
                  (not (clear ?to)))  ;; now to is not clear
                  
  )
)
  ;; all we care abpu is that the thing yu are moving it from -> disc is on from, 
  ;; is the thing moving a disc
  ;; is the thing moving from a pillar
  ;; is the thing moving to a pillar or 
  ;; is the thing moving to a pillar or is the disk smaller
  ;; is the disc on the from pillar



  ;; 
  ; :precondition (and (is_disc ?disc)  ;; is the thing moving a disc
  ;  (or(is_pillar ?from) (is_disc ?from)   ;; is the thing moving from a pillar or a disk
  ;  (or(is_pillar ?to) (is_disc ?to))  ;; is the thing moving to a pillar or a disk
  ;  (or(is_pillar ?to) (smaller ?disc ?to))   ;; is the thing moving to a pillar or is the disk smaller
  ;  (on ?disc ?from)   ;; is the disc actually on the from pillar
  ;  (clear ?disc) ;; is the thing you are moving clear
  ;  (clear ?to)) ;; is the thing you are moving to clear
  ; :effect  (and (clear ?from)  ;; now from is clear
  ;   (on ?disc ?to)  ;; now disc is on to
  ;   (not (on ?disc ?from))  ;; now disc is not not on from
  ;   (not (clear ?to)))  ;; now to is not clear
  ;   )

;;effecys
  ;; now from is clear
  ;; now disc is not not on from
  ;; now disk is on to
  ;; now to is not clear
  ;; now disk is clear



