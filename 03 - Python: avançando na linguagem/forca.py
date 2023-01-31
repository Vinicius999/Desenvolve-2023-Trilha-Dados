def play():
    print('=' * 40)
    print(f'={"Bem vindo ao jogo da Forca!":^38}-')
    print('=' * 40)
    
    secret_word = 'banana'
    right_letters = ['_' for i in secret_word]
    
    hanged = win = False # Enforcou e acertou
    print(right_letters)

    while (not hanged and not win):
        shot = input('Qual letra? ').strip()
        
        index = 0
        for letter in secret_word:
            if (shot.upper() == letter.upper()):
                right_letters[index] = letter
            index += 1
        
        print(right_letters)
        print(f'Ainda faltam acertar {right_letters.count("_")} letras')
        
    print('Fim do jogo!')
        

if __name__ == '__main__':
    play()