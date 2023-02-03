import forca
import adivinhacao


def choose_game():
    print('=' * 40)
    print(f'={"Escolha o seu jogo":^38}-')
    print('=' * 40)

    print('(1) Forca (2) Adivinhação')

    game = int(input('Qual jogo? '))

    if (game == 1):
        print('Jogando forca')
        forca.jogar()
    elif (game == 2):
        print('Jogando adivinhação')
        adivinhacao.jogar()


if(__name__ == '__main__'):
    choose_game()
