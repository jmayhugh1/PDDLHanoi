(define (problem hanoi-problem)
  (:domain hanoi)
  (:objects
    disk1 disk2 
    peg1 peg2 peg3
  )
  (:init
    
    (is_disc disk1)
    (is_disc disk2)

    (is_peg peg1)
    (is_peg peg2)
    (is_peg peg3)

    
    (on disk1 peg1)  ; Disk 1 is on peg 1
    (on disk2 peg1)  ; Disk 2 is on peg 1
    (on disk1 disk2)  ; Disk 1 is on peg 1
   
    (clear disk1)    ; Disk 1 is clear, it's on top
    (smaller disk1 disk2)  ; Disk 1 is smaller than Disk 2

   
    (clear peg2)     ; Peg 2 is clear
    (clear peg3)     ; Peg 3 is clear
  )
  (:goal
    (and
      (on disk1 peg3)  ; Disk 1 should be on peg 3
      (on disk2 peg3)  ; Disk 2 should be on peg 3
      
      
    )
  )
)
    ; (on disk1 peg1)  ; Disk 1 is on peg 1
    ; (on disk2 peg1)  ; Disk 2 is on peg 1
    ; (on disk1 disk2)  ; Disk 1 is on peg 1
   
    ; (clear disk1)    ; Disk 1 is clear, it's on top
    ; (smaller disk1 disk2)  ; Disk 1 is smaller than Disk 2

   
    ; (clear peg2)     ; Peg 2 is clear
    ; (clear peg3)     ; Peg 3 is clear

    ; move (disk1 peg1 peg3)
    ; for disk1 disk2 either not in peg3 or disk1 smaller than

    ; effect 
  
