;;;======================================================
;;;   Sports Expert System
;;;======================================================

;;****************
;;* DEFFUNCTIONS *
;;****************

(deffunction ask-question (?question $?values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction answers (?question)
   (bind ?response (ask-question ?question yes no both y n b))
   (if (or (eq ?response yes) (eq ?response y))
       then yes 
       else 
       (if (or (eq ?response no) (eq ?response n))
       then no
       else both)))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule running ""
   (not (run ?))
   (not (sports ?))
   =>
   (assert (run-ans (answers "Do you like running? (yes/no)? "))))
   
(defrule contact ""
   (run-ans yes)
   (not (sports ?))
   =>
   (assert (contact-ans (answers "Do you prefer contact sports (yes/no)? "))))

(defrule alone ""
   (run-ans no)
   (not (sports ?))   
   =>
   (assert (alone-ans (answers "Do you like to play sport alone (yes/no)? "))))
   
(defrule throwing ""
   (contact-ans yes)
   (not (sports ?))
   =>
   (assert (throwing-ans (answers "Do you like throwing or kicking (yes - throwing/no - kicking/both - kicking and throwing)? "))))

(defrule playing ""
   (contact-ans no)
   (not (sports ?))
   =>
   (assert (playing-ans (answers "Do you like playing on a Team or as an individual (yes - Team/no - individual)? "))))

(defrule water ""
   (alone-ans yes)
   (not (sports ?))   
   =>
   (assert (water-ans (answers "Do you like water (yes/no)? "))))

(defrule music ""
   (alone-ans no)
   (not (sports ?))   
   =>
   (assert (music-ans (answers "Do you like exercising to music (yes/no)? "))))
   

;;;****************
;;;* REPAIR RULES *
;;;****************

(defrule basketball ""
   (throwing-ans yes)
   (not (sports ?))
   =>
   (assert (sports "You may like Basketball.")))

(defrule football ""
   (throwing-ans no)
   (not (sports ?))
   =>
   (assert (sports "You may like Football.")))

(defrule rugby ""
   (throwing-ans both)
   (not (sports ?))
   =>
   (assert (sports "You may like Rugby.")))

(defrule cricket ""
   (playing-ans yes)
   (not (sports ?))
   =>
   (assert (sports "You may like Cricket.")))

(defrule tennis ""
   (playing-ans no)
   (not (sports ?))
   =>
   (assert (sports "You may like Tennis.")))

(defrule ballroom ""
   (music-ans yes)
   (not (sports ?))
   =>
   (assert (sports "You may like Ballroom-Dancing.")))

(defrule table ""
   (music-ans no)
   (not (sports ?))
   =>
   (assert (sports "You may like Table-Tennis.")))

(defrule swimming ""
   (water-ans yes)
   (not (sports ?))
   =>
   (assert (sports "You may like Swimming.")))

(defrule archery ""
   (water-ans no)
   (not (sports ?))
   =>
   (assert (sports "You may like Archery.")))

;;;********************************
;;;* STARTUP AND CONCLUSION RULES *
;;;********************************

(defrule sports-system ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "Sports Expert System")
  (printout t crlf crlf))

(defrule print-sports ""
  (declare (salience 10))
  (sports ?item)
  =>
  (printout t crlf crlf)
  (printout t "Suggested Sports:")
  (printout t crlf crlf)
  (format t " %s%n%n%n" ?item))