(define (problem hanoi-3-discs)
  (:domain hanoi)
  
  (:objects
    disc1 
    disc2
    disc3
    disc4
    disc5
    
   
    
    peg1 
    peg2 
    peg3
  )
  

  
  (:init
    (is_disc disc1)
    (is_disc disc2)
    (is_disc disc3)
    (is_disc disc4)
    (is_disc disc5)



    (is_pillar peg1)
    (is_pillar peg2)
    (is_pillar peg3)
    


    (on disc1 disc2)
    (on disc2 disc3)
    (on disc3 disc4)
    (on disc4 disc5)



    (on_directly disc1 disc2)
    (on_directly disc2 disc3)
    (on_directly disc3 disc4)
    (on_directly disc4 disc5)
    (on_directly disc5 peg1)


    (on disc1 peg1)
    (on disc2 peg1)
    (on disc3 peg1)
    (on disc4 peg1)
    (on disc5 peg1)

    (smaller disc1 disc2)
    (smaller disc2 disc3)
    (smaller disc3 disc4)
    (smaller disc4 disc5)
   

    (clear disc1)
    (clear peg2)
    (clear peg3)


  )

  (:goal
    (and
      (on disc1 disc2)
      (on disc2 disc3)
      (on disc3 disc4)
      (on disc4 disc5)
      


      (on disc1 peg3)
      (on disc2 peg3)
    
      
      
      
    )
  )
)
