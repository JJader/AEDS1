def TrocaLetra(a,b, crip):
    if crip:
        c = ord(a) + ord(b)
        if (c > 127):
            c = c%127
        return chr(c)
    else:
        c = ord(a) - ord(b)
        if (c < 0):
            c = c + 127
        return chr(c)


def Criptografa(arq, crip):
    import os
    file = open(arq, 'r')
    newFile = open(crip, 'w')
    chave = input("Digite a chave desejada: ")
    linha = file.read()

    newLinha = list(linha)

    for x in range(len(linha)):
        j = x
        if (j >= len(chave)):
            j = j % len(chave)
        newLinha[x] = TrocaLetra(chave[j],linha[x], True)
    
    newLinha = ''.join(newLinha)
    newFile.write(newLinha)

    print("Criptografia realizada com sucesso")
    os.system("pause")
    newFile.close()
    file.close()


def Descriptografar(crip, descrip):
    import os
    file = open(crip, 'r')
    newFile = open(descrip, 'w')
    chave = input("Digite a chave desejada: ")
    linha = file.read()

    newLinha = list(linha)

    for x in range(len(linha)):
        j = x
        if (j >= len(chave)):
            j = j % len(chave)
        newLinha[x] = TrocaLetra(linha[x],chave[j], False)
    
    newLinha = ''.join(newLinha)
    newFile.write(newLinha)

    print("Descriptografia realizada com sucesso\n-----> Abra o arquivo descrip.txt")
    os.system("pause")
    newFile.close()
    file.close()

import os
os.system("cls")
arquivoName = "arquivo.txt"
criptografiaName = "crip.txt"
descriptografiaName = "descrip.txt"

a = int(input("0 --> criptografa  \n1 --> descriptografar\n ---->"))
if(a == 0):
    Criptografa(arquivoName, criptografiaName)
elif (a == 1):
    Descriptografar(criptografiaName, descriptografiaName)