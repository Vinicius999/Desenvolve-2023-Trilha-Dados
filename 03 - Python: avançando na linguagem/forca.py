from random import choice


def game_opening_message():
    print('=' * 40)
    print(f'={"Bem vindo ao jogo da Forca!":^38}-')
    print('=' * 40)

def load_secret_word():
    with open('words.txt', 'r') as file:
        words_list = [line.strip() for line in file]

    secret_word = choice(words_list).upper() # Choosing secret word  
    return secret_word

def initialize_secret_words(word):
    return ['_' for i in word]

def score_correct_move(move, secret_word, right_letters):
    index = 0
    for letter in secret_word:
        if (move == letter):
            right_letters[index] = letter
        index += 1

def desenha_forca(errors):
    print("  _______     ")
    print(" |/      |    ")

    if(errors == 1):
        print(" |      (_)   ")
        print(" |            ")
        print(" |            ")
        print(" |            ")

    if(errors == 2):
        print(" |      (_)   ")
        print(" |      \     ")
        print(" |            ")
        print(" |            ")

    if(errors == 3):
        print(" |      (_)   ")
        print(" |      \|    ")
        print(" |            ")
        print(" |            ")

    if(errors == 4):
        print(" |      (_)   ")
        print(" |      \|/   ")
        print(" |            ")
        print(" |            ")

    if(errors == 5):
        print(" |      (_)   ")
        print(" |      \|/   ")
        print(" |       |    ")
        print(" |            ")

    if(errors == 6):
        print(" |      (_)   ")
        print(" |      \|/   ")
        print(" |       |    ")
        print(" |      /     ")

    if (errors == 7):
        print(" |      (_)   ")
        print(" |      \|/   ")
        print(" |       |    ")
        print(" |      / \   ")

    print(" |            ")
    print("_|___         ")
    print()


def print_winning_message():
    print("Parabéns, você ganhou!")
    print("       ___________      ")
    print("      '._==_==_=_.'     ")
    print("      .-\\:      /-.    ")
    print("     | (|:.     |) |    ")
    print("      '-|:.     |-'     ")
    print("        \\::.    /      ")
    print("         '::. .'        ")
    print("           ) (          ")
    print("         _.' '._        ")
    print("        '-------'       ")
    
def print_loser_message(secret_word):
    print("Puxa, você foi enforcado!")
    print(f"A palavra era {secret_word}")
    print("    _______________       ")
    print("   /               \      ")
    print("  /                 \     ")
    print("//                   \/\  ")
    print("\|   XXXX     XXXX   | /  ")
    print(" |   XXXX     XXXX   |/   ")
    print(" |   XXX       XXX   |    ")
    print(" |                   |    ")
    print(" \__      XXX      __/    ")
    print("   |\     XXX     /|      ")
    print("   | |           | |      ")
    print("   | I I I I I I I |      ")
    print("   |  I I I I I I  |      ")
    print("   \_             _/      ")
    print("     \_         _/        ")
    print("       \_______/          ")


def play():
    game_opening_message()
    secret_word = load_secret_word()
    
    right_letters = initialize_secret_words(secret_word)
    print(right_letters)
    
    errors = 0

    while True:
        move = input('\nQual letra? ').strip().upper()
        
        if (move in secret_word):
            score_correct_move(move, secret_word, right_letters)
        else:
            errors += 1
            desenha_forca(errors)
        
        if (errors == 7) or ('_' not in right_letters):
            break       
        
        print(right_letters)
        print(f'Ainda faltam acertar {right_letters.count("_")} letras')
    
    print_winning_message() if ('_' not in secret_word) else  print_loser_message(secret_word)
        

if __name__ == '__main__':
    play()



