;; The Towers of Hanoi problem (formalisation by Hector Geffner).

(define (domain hanoi)
  (:requirements :strips)
  (:predicates (clear ?x) (on ?x ?y) (smaller ?x ?y) (is_disc ?x) (is_pillar ?y) (on_directly ?x ?y))

  (:action move_to_pillar
    :parameters (?disc ?to_pillar ?from_peg ?from_on ) ; disc
    :precondition (and 
                  (is_disc ?disc)
                  
                  ; is actualy on a pillar anf moving ti a pilar
                  (is_pillar ?from_peg)
                  (is_pillar ?to_pillar)

                  ;; is the disc actually on thepllar we say its on and sitting on the thing we say its on
                  (on_directly ?disc ?from_on)
                  (on ?disc ?from_peg)


                  ;(or (is_disc ?from_on) (is_pillar ?from_on)) ;;is the things its moving from a pillar or disc

                  (clear ?disc)
                  (clear ?to_pillar)
                  ) ;; is the thing you are moving to clear

                  ;; current problem here move_to_pillar disc1 peg3 peg3 peg2 (1)
                  ;; disc1 is on peg3, but isnt directly on it , disc2 is underneath, but still marks it as clear
    
                  
  :effect         (and 
                  
                  (clear ?from_on)
                  (on ?disc ?to_pillar)
                  (on_directly ?disc ?to_pillar)


                  ;; removing direct touch and total touch from old spots
                  (not (on_directly ?disc ?from_on))
                  (not (on ?disc ?from_on))
                  (not (on ?disc ?from_peg))

                  ;; now the new pillar is not clear
                  (not (clear ?to_pillar))

                  )  ;; now to is not clear
                  
  )
  (:action move_to_disc
      :parameters (?disc ?to_disc ?to_peg ?from_peg ?from_on )
      :precondition (and
                    (is_disc ?disc)
                    (is_disc ?to_disc)
                    
                    ; is actualy on a pillar anf moving ti a pilar
                    (is_pillar ?from_peg)
                    
                    (is_pillar ?to_peg)

                    (smaller ?disc ?to_disc)
                    ;are things on the things we say

                    (on ?to_disc ?to_peg)


                    (on ?disc ?from_on)
                    (on_directly ?disc ?from_on)


                    (on ?disc ?from_peg)

                    ;; is the disc actually on thepllar we say its on and sitting on the thing we say its on
                    
                    ;(or (is_disc ?from_on) (is_pillar ?from_on)) ;;is the things its moving from a pillar or disc
                    (clear ?disc)
                    (clear ?to_disc)
                    )
      :effect (and 
              (clear ?from_on)

              ;;moving the disk to peg
              (on ?disc ?to_peg)
              ;; moving disc directly ontop of new disk
              (on_directly ?disc ?to_disc)
              (on ?disc ?to_disc)


              (not (on ?disc ?from_peg))
              (not (on ?disc ?from_on))
              (not (on_directly ?disc ?from_peg))
              (not (on_directly ?disc ?from_on))
              (not (clear ?to_disc))
              (clear ?from_on)
      )
  )
  
)
  ;; all we care abpu is that the thing yu are moving it from -> disc is on from, 
  ;; is the thing moving a disc
  ;; disc is no the same as from or to
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



