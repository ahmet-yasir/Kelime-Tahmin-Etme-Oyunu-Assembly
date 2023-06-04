ORG 100h

jmp basla

kelime1 db 'elma'
kelime2 db 'kale'
kelime3 db 'kalem'
kelime4 db 'liman'
kelime5 db 'merak'
kelime6 db 'ipek'
kelime7 db 'kalp'
kelime8 db 'sal'
kelime9 db 'serin'
kelime10 db 'resim'
oyunu_bitir db 'bitir'
puan db '0',0Dh,0Ah,'puan kazandınız!$'  ; kullanıcının puanını saklamak için 
girilenKelime db 20 DUP('$') ; Kullanıcının girdiği kelimeyi saklamak için
;yeni_saitr db 0Ah

basla:
    mov dx, offset msg_basla
    mov ah, 9
    int 21h ; Ekrana mesaj yazdırma
    
    mov dx, offset msg_harfler
    mov ah, 9
    int 21h ; Ekrana mesaj yazdırma

    mov ah, 0Ah
    lea dx, girilenKelime
    int 21h ; Kullanıcıdan kelime girişi al
    mov bl,48d   ; 0 sayısının ascii karşılığı
    jmp Yeni_Kelime

oyun_sonu:
    mov [puan],bl
    mov dx,0Ah         ;alt satıra geçmek için
    mov ah, 02h  
    int 21h
    
    mov dx,0Dh          ; satırın başına gelmek için
    mov ah, 02h  
    int 21h    
    
    mov dx,offset puan
    mov ah,9
    int 21h ; Ekrana mesaj yazdırma
    
    ;mov dx, offset msg_oyun_sonu
    ;mov ah, 9
    ;int 21h ; Ekrana mesaj yazdırma
    
    ret
    
Yeni_Kelime:
    mov ah, 0Ah
    mov dx, offset msg_Yeni_Kelime
    mov ah, 9
    int 21h ;
    mov ah, 0Ah
    lea dx, girilenKelime
    int 21h ; Kullanıcıdan kelime girişi al
    
    ;oyun sonu kontrol
    lea si,girilenKelime   ;lea komutu etkin adresi yüklemek için 
    lea di,oyunu_bitir        
    mov cx,0		   ;inc ve dec komutları harflerin bellekteki yerini ayarlamak için
    dec di
    inc si
    inc si
    harf_kontrol_bitir:
    inc cx
    cmp cx,6		    ;cx=harf sayısı+1	    
    je oyun_sonu
    inc di
    lodsb		    ;lodsb si registerindeki string dizisinin ilk karakteribi al registerine atar ve si registerini bir artırır.Sonraki kullanımlarda kaldığı yerden devam eder 
    cmp al,[di]
    je harf_kontrol_bitir
    
    jmp Kelime_kontrol

kelime_eslesti:
    add bl,1 ; Puanı artır
    mov dx, offset msg_kelime_bulundu
    mov ah, 9
    int 21h ; Ekrana mesaj yazdırma
    jmp Yeni_Kelime
               
Kelime_kontrol:

    ; kelime1 kontrol
    lea si,girilenKelime   ;lea komutu etkin adresi yüklemek için 
    lea di,kelime1         
    mov cx,0		   ;inc ve dec komutları harflerin bellekteki yerini ayarlamak için
    dec di
    inc si
    inc si
    harf_kontrol1:
    inc cx
    cmp cx,5		    ;cx=harf sayısı+1
    je kelime_eslesti
    inc di
    lodsb                   ;lodsb si registerindeki string dizisinin ilk karakteribi al registerine atar ve si registerini bir artırır.Sonraki kullanımlarda kaldığı yerden devam eder 
    cmp al,[di]
    je harf_kontrol1    
    ; kelime2 kontrol
    
    lea si,girilenKelime   ;lea komutu etkin adresi yüklemek için 
    lea di,kelime2         
    mov cx,0		   ;inc ve dec komutları harflerin bellekteki yerini ayarlamak için
    dec di
    inc si
    inc si
    harf_kontrol2:
    inc cx
    cmp cx,5		    ;cx=harf sayısı+1
    je kelime_eslesti
    inc di
    lodsb		    ;lodsb si registerindeki string dizisinin ilk karakteribi al registerine atar ve si registerini bir artırır.Sonraki kullanımlarda kaldığı yerden devam eder
    cmp al,[di]
    je harf_kontrol2
        
    ;kelime3 kontrol
    lea si,girilenKelime   ;lea komutu etkin adresi yüklemek için 
    lea di,kelime3         
    mov cx,0		   ;inc ve dec komutları harflerin bellekteki yerini ayarlamak için
    dec di
    inc si
    inc si
    harf_kontrol3:
    inc cx
    cmp cx,6		    ;cx=harf sayısı+1
    je kelime_eslesti
    inc di
    lodsb		     ;lodsb si registerindeki string dizisinin ilk karakteribi al registerine atar ve si registerini bir artırır.Sonraki kullanımlarda kaldığı yerden devam eder
    cmp al,[di]
    je harf_kontrol3
        
    ;kelime4 kontrol
    lea si,girilenKelime   ;lea komutu etkin adresi yüklemek için 
    lea di,kelime4         
    mov cx,0		   ;inc ve dec komutları harflerin bellekteki yerini ayarlamak için
    dec di
    inc si
    inc si
    harf_kontrol4:
    inc cx
    cmp cx,6		    ;cx=harf sayısı+1
    je kelime_eslesti
    inc di
    lodsb		    ;lodsb si registerindeki string dizisinin ilk karakteribi al registerine atar ve si registerini bir artırır.Sonraki kullanımlarda kaldığı yerden devam eder
    cmp al,[di]
    je harf_kontrol4
        
    ;kelime5 kontrol
    lea si,girilenKelime   ;lea komutu etkin adresi yüklemek için 
    lea di,kelime5         
    mov cx,0		   ;inc ve dec komutları harflerin bellekteki yerini ayarlamak için
    dec di
    inc si
    inc si
    harf_kontrol5:
    inc cx
    cmp cx,6		    ;cx=harf sayısı+1
    je kelime_eslesti
    inc di
    lodsb		     ;lodsb si registerindeki string dizisinin ilk karakteribi al registerine atar ve si registerini bir artırır.Sonraki kullanımlarda kaldığı yerden devam eder
    cmp al,[di]
    je harf_kontrol5
    
    ;kelime6 kontrol
    lea si,girilenKelime   ;lea komutu etkin adresi yüklemek için 
    lea di,kelime6         
    mov cx,0		   ;inc ve dec komutları harflerin bellekteki yerini ayarlamak için
    dec di
    inc si
    inc si
    harf_kontrol6:
    inc cx
    cmp cx,5		    ;cx=harf sayısı+1
    je kelime_eslesti2
    inc di
    lodsb		     ;lodsb si registerindeki string dizisinin ilk karakteribi al registerine atar ve si registerini bir artırır.Sonraki kullanımlarda kaldığı yerden devam eder
    cmp al,[di]
    je harf_kontrol6
    
    ;kelime7
    lea si,girilenKelime   ;lea komutu etkin adresi yüklemek için 
    lea di,kelime7         
    mov cx,0		   ;inc ve dec komutları harflerin bellekteki yerini ayarlamak için
    dec di
    inc si
    inc si
    harf_kontrol7:
    inc cx
    cmp cx,5		    ;cx=harf sayısı+1
    je kelime_eslesti2
    inc di
    lodsb 	 	    ;lodsb si registerindeki string dizisinin ilk karakteribi al registerine atar ve si registerini bir artırır.Sonraki kullanımlarda kaldığı yerden devam eder
    cmp al,[di]
    je harf_kontrol7
    
    ;kelime8 kontrol
    lea si,girilenKelime   ;lea komutu etkin adresi yüklemek için 
    lea di,kelime8        
    mov cx,0		   ;inc ve dec komutları harflerin bellekteki yerini ayarlamak için
    dec di
    inc si
    inc si
    harf_kontrol8:
    inc cx
    cmp cx,4		    ;cx=harf sayısı+1
    je kelime_eslesti2
    inc di
    lodsb		    ;lodsb si registerindeki string dizisinin ilk karakteribi al registerine atar ve si registerini bir artırır.Sonraki kullanımlarda kaldığı yerden devam eder
    cmp al,[di]
    je harf_kontrol8
    
    ;kelime9 kontrol
    lea si,girilenKelime   ;lea komutu etkin adresi yüklemek için 
    lea di,kelime9         
    mov cx,0		   ;inc ve dec komutları harflerin bellekteki yerini ayarlamak için
    dec di
    inc si
    inc si
    harf_kontrol9:
    inc cx
    cmp cx,5		    ;cx=harf sayısı+1
    je kelime_eslesti2
    inc di
    lodsb		    ;lodsb si registerindeki string dizisinin ilk karakteribi al registerine atar ve si registerini bir artırır.Sonraki kullanımlarda kaldığı yerden devam eder
    cmp al,[di]
    je harf_kontrol9
    
    ;kelime10 kontrol
    lea si,girilenKelime   ;lea komutu etkin adresi yüklemek için 
    lea di,kelime10         
    mov cx,0		   ;inc ve dec komutları harflerin bellekteki yerini ayarlamak için
    dec di
    inc si
    inc si
    harf_kontrol10:
    inc cx                  ;cx=harf sayısı+1
    cmp cx,5		    
    je kelime_eslesti2
    inc di
    lodsb		    ;lodsb si registerindeki string dizisinin ilk karakteribi al registerine atar ve si registerini bir artırır.Sonraki kullanımlarda kaldığı yerden devam eder
    cmp al,[di]
    je harf_kontrol10

    jne Kelime_bulunamadi
       
    kelime_eslesti2:
        add bl,1 ; Puanı artır
        mov dx, offset msg_kelime_bulundu
        mov ah, 9
        int 21h ; Ekrana mesaj yazdırma
        jmp Yeni_Kelime
    
    Kelime_bulunamadi:
        mov ah, 0Ah
        mov dx, offset msg_kelime_bulunamadi
        mov ah, 9
        int 21h 
        jmp Yeni_Kelime

msg_basla db 'Kelime Bulma oyununa hoş geldiniz!', 0Dh, 0Ah, '$'
msg_harfler db "Kullanabileceğiniz harfler 'A E İ K L M S R P N' başlamak için enter'a basınız.", 0Dh, 0Ah, '$'   ;$ işrateri stringin sonu olduğunu anlamak için 0dh ve 0ah alt satıra geçip satırın başına gelmek için
msg_Yeni_Kelime db 'Tahmininizi yapınız! Oyunu sonlandırmak için "bitir" yazınız. ', 0Dh, 0Ah, '$'                ; 0ah alt satır 0dh satır başı 
msg_kelime_bulunamadi db " kelimesi bulunamadi!",0Dh,0Ah,'$'
msg_kelime_bulundu db " kelimesini doğru bildiniz bir puan kazandınız!",0Dh,0Ah,'$'
;msg_oyun_sonu db "puanınız:",0Dh,0Ah,'$'
END
