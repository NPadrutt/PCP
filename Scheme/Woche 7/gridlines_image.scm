; GIMP Skript das ein konfigurierbares Gitternetz im GIMP zeichnet
; Im GIMP und im Menu registrieren
(script-fu-register 
 "script-fu-grid-lines-image" ; Funktionsname
 "New gridlines"	; Menu Punkt
 "Illustrates the structure of a GIMP script" ; Beschreibung
 "Roger Diehl"          ; Autor
 "2018, HSLU - I"     ; Copyright Notiz
 "October 2018"         ; Erstellungsdatum
 ""                     ; Bild Typ des Skript - "" heisst, es muss kein Bild geladen sein
 ; aktuelle Parameter von script-fu-grid-lines-image
 SF-IMAGE "Image" 0
 SF-ADJUSTMENT "Spacing" '(20 2 100 1 1 0 1)         ; spacing - default 20
 SF-BRUSH "Brush" '("Circle (01)" 100.0 1 0)         ; brush - default Circle (01)
 SF-ADJUSTMENT "Brush Size" '(4 1 100 1 10 0 1)
 SF-COLOR "Foreground" '(255 255 255)                ; foreground color - default white
 SF-TOGGLE "Horizontal lines" TRUE                   ; horizontal - default TRUE
 SF-TOGGLE "Vertical lines" FALSE                    ; vertical - default FALSE
 SF-TOGGLE "Dashed lines" FALSE                      ; dashed - default FALSE
 )
(script-fu-menu-register "script-fu-grid-lines-image"
                         "<Image>/File/Gridlines_Image")

; Das eigentliche Skript
(define (script-fu-grid-lines-image image spacing brush brush-size foreground horizontal vertical dashed)
  
  (gimp-context-push)
  (let*(
        ; Grundeinstellungen - Farbe, Breite, Höhe, Ebene...
        (color 0)
        (drawable_width (car(gimp-image-width image)))
	(drawable_height (car(gimp-image-height image)))
        
        (layer (car(gimp-layer-new image drawable_width drawable_height RGBA-IMAGE "grid-layer" 100 NORMAL-MODE)))
        (layer_width (car(gimp-drawable-width layer)))
        (layer_height (car(gimp-drawable-height layer)))
        ; Anfangs- und Endpunkt einer Linie definieren x1, y1, x2, y2
        (point (cons-array 4 'double))
        (invert FALSE)
        )
    ; Gimp Kontext sezten - Transparenz, Hintergrund, Vordergrund, Pinsel, Füllfarbe, Ebene...
    (set! color TRANSPARENT-FILL)
    
    ;(gimp-context-set-foreground  foreground)
    (gimp-context-set-brush (car brush))
    (gimp-context-set-brush-size brush-size)
    (gimp-drawable-fill layer color)
    (gimp-image-add-layer image layer -1)
    
    ; Demo zum Zeichnen einer Linie
    (define (draw_line x1 y1 x2 y2)
      ; Variablen x1, y1, x2, y2 den Anfangs- und Endpunkten der Linie zuordnen
      (aset point 0 x1)
      (aset point 1 y1)
      (aset point 2 x2)
      (aset point 3 y2)
      ; Linie zeichnen
      (gimp-paintbrush-default layer 4 point)
      )
    (cond
      ((and (eq? vertical FALSE) (eq? horizontal FALSE))
       (draw_line spacing spacing (- layer_width spacing) (- layer_height spacing))
           ))
    
    
    ; ab hier die Gitterlinien-Funktionen...

    ; Horizontale Linie
    (define (draw_horizontal yPosition)
      (cond
        ((< yPosition layer_height)
         (draw_line 0 yPosition layer_width yPosition)
         (draw_horizontal (+ yPosition spacing))
        )
       )
     )

    ; Horizontale Linie dashed
    (define (draw_horizontal_dashed xPosition yPosition)
      (cond
        ((< yPosition layer_height)
         (cond
           ((<= xPosition layer_width)
           (draw_line xPosition yPosition (+ xPosition spacing) yPosition)
           (draw_horizontal_dashed (+ xPosition (* 2 spacing)) yPosition)
           )
           (else (draw_horizontal_dashed 0 (+ yPosition spacing)))
          )
        )
       )
     )

    ; Vertikale Linie
    (define (draw_vertical xPosition)
      (cond
        ((< xPosition layer_width)
         (draw_line xPosition 0 xPosition layer_height )
         (draw_vertical (+ xPosition spacing))
        )
       )
     )

    
    ; Vertikale Linie dashed
    (define (draw_vertical_dashed xPosition yPosition)
      (cond
        ((< xPosition layer_width)
         (cond
           ((<= yPosition layer_height)
           (draw_line xPosition yPosition xPosition (+ yPosition spacing))
           (draw_vertical_dashed xPosition (+ yPosition (* 2 spacing)))
           )
           (else (draw_vertical_dashed (+ xPosition spacing) 0))
          )
        )
       )
     )

     (cond
        ((and (eq? horizontal TRUE) (eq? vertical FALSE) (eq? dashed FALSE)) (draw_horizontal spacing))
        ((and (eq? horizontal TRUE) (eq? vertical FALSE) (eq? dashed TRUE)) (draw_horizontal_dashed 0 spacing))
        ((and (eq? horizontal FALSE) (eq? vertical TRUE) (eq? dashed FALSE)) (draw_vertical spacing))        
        ((and (eq? horizontal FALSE) (eq? vertical TRUE) (eq? dashed TRUE)) (draw_vertical_dashed spacing 0))        
        ((and (eq? horizontal TRUE) (eq? vertical TRUE) (eq? dashed FALSE)) (draw_horizontal spacing) (draw_vertical spacing))        
        ((and (eq? horizontal TRUE) (eq? vertical TRUE) (eq? dashed TRUE)) (draw_horizontal_dashed 0 spacing) (draw_vertical_dashed spacing 0))
      )
    
    ; ...Ende der Gitterlinien-Funktionen
    
    ; Bild anzeigen
    (gimp-context-pop)
    (gimp-displays-flush)
    (gimp-image-clean-all image)
    )
  )
