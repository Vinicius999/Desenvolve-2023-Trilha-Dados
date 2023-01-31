from random import randrange

def play():

    print('=' * 40)
    print(f'={"Bem vindo ao jogo da Adivinhação!":^38}-')
    print('=' * 40)

    secret_number = randrange(1,101)
    total_shot = 0
    points = 1000

    print('Qual nível de dificuldade?')
    print('(1) Fácil (2) Médio (3) Difícil')

    level = int(input('Defina o nível: '))

    if (level == 1):
        total_shot = 20
    elif (level == 2):
        total_shot = 10
    else:
        total_shot = 5

    for rodada in range(1, total_shot + 1):
        print('Tentativa {} de {}'.format(rodada, total_shot))

        chute_str = input('Digite um número entre 1 e 100: ')
        print('Você digitou ' , chute_str)
        chute = int(chute_str)

        if(chute < 1 or chute > 100):
            print('Você deve digitar um número entre 1 e 100!')
            continue

        acertou = chute == secret_number
        maior   = chute > secret_number
        menor   = chute < secret_number

        if(acertou):
            print('Você acertou e fez {} pontos!'.format(pontos))
            break
        else:
            if(maior):
                print('Você errou! O seu chute foi maior do que o número secreto.')
            elif(menor):
                print('Você errou! O seu chute foi menor do que o número secreto.')
            pontos_perdidos = abs(secret_number - chute)
            points = points - pontos_perdidos

    print('Fim do jogo')


if(__name__ == '__main__'):
    play()
