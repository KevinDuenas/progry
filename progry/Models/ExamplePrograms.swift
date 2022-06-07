//
//  ExamplePrograms.swift
//  progry
//
//  Created by Kevin Duenas on 06/06/22.
//

import Foundation


class ExamplePrograms {
    
    var programs = [Program]()
    
    init(){
        loadPrograms()
    }
    
    
    
    func loadPrograms(){
        
        let fiboRecursive = Program()
        fiboRecursive.name = "Fibonacci Recursivo"
        fiboRecursive.code = """
            PROGRAM_START
                var number prueba
            
            module fibo : number (number n){
                var number ret
                if(n == 0) do {
                    ret = 0
                }else{
                    if(n == 1 || n == 2) do {
                        ret = 1
                    }else{
                        ret = fibo(n - 2) + fibo(n - 1)
                    }
                }
            
                return ret
            }
            
            main {
                prueba = fibo(9)
                write(prueba)
            }
            
            PROGRAM_END
            """
        programs.append(fiboRecursive)
        let fiboCiclico = Program()
        fiboCiclico.name = "Fibonacci Cícliclo"
        fiboCiclico.code = """
            PROGRAM_START
                var number i
                var number n
                var number next
                var number t1
                var number t2

            main {
                n = 9
                t1 = 0
                t2 = 1
                next = t1 + t2

                for i = 3 to n do {
                    t1 = t2
                    t2 = next
                    next = t1 + t2
                }
                write(next)
            }

            PROGRAM_END
        """
        programs.append(fiboCiclico)
        let factRecursive = Program()
        factRecursive.name = "Factorial Recursivo"
        factRecursive.code = """
            PROGRAM_START
            var number prueba
                            
            module fact : number (number n){
                var number ret
                if(n == 1) do {
                    ret = n
                } else {
                    ret = n * fact(n - 1)
                }
                    return ret
            }
                            
            main {
                prueba = fact(10)
                write(prueba)
            }
                            
            PROGRAM_END
                            
            """
        programs.append(factRecursive)
        let factCicliclo = Program()
        factCicliclo.name = "Factorial Cíclico"
        factCicliclo.code = """
            PROGRAM_START
                var number i
                var number n
                var number factorial

            main {
                n = 10
                factorial = 1

                for i = 1 to n do {
                    factorial = factorial * i
                }
                write(factorial)
            }

            PROGRAM_END
        """
        programs.append(factCicliclo)
        let findVector = Program()
        findVector.name = "Buscar en un vector"
        findVector.code = """
            PROGRAM_START
            
                var number index
                var number end
                var number arr[5]
                var number find
                var number curr
            
            main {
                find = 32
                end = 4
                arr[0] = 10
                arr[1] = 23
                arr[2] = 43
                arr[3] = 32
                arr[4] = 34
            
                for index = 0 to end do {
                    curr = arr[index]
                    if (curr == find) do {
                        write("Encontrado en el indice", index)
                    }
                }
            
            }
            
            PROGRAM_END
        """
        programs.append(findVector)
        
        let sortVector = Program()
        sortVector.name = "Ordenar un arreglo"
        sortVector.code = """
            PROGRAM_START

                var number index
                var number j
                var number end
                var number ends
                var number arr[5]
                var number temp

            main {
                end = 4
                arr[0] = 5
                arr[1] = 10
                arr[2] = 1
                arr[3] = 3
                arr[4] = 7
                temp = 0
                ends = 3


                for index = 0 to end do {
                    for j = 0 to ends do {
                        if (arr[j+ 1] < arr[j]) do {
                            temp = arr[j + 1]
                            arr[j + 1] = arr[j]
                            arr[j] = temp
                        }
                    }
                }
                for index = 0 to end do {
                    write(arr[index])
                }
            }

            PROGRAM_END
        """
        programs.append(sortVector)
        
        let multiplyMat = Program()
        multiplyMat.name = "Multiplicación de matrices"
        multiplyMat.code = """
            PROGRAM_START
                
                    var number one[2,3]
                    var number two[3,2]
                    var number res[2,2]
                    var number i
                    var number j
                    var number x
                
                main {
                
                    for i = 0 to 1 do {
                        for j = 0 to 2 do {
                            one[i,j] = i + j
                        }
                    }
                
                    for i = 0 to 2 do {
                        for j = 0 to 1 do {
                            two[i,j] = i + j
                        }
                    }
                
                    for i = 0 to 1 do {
                        for j = 0 to 1 do {
                            for x = 0 to 2 do {
                                res[i,j] = res[i,j] + one[i,x] * two[x,j]
                            }
                        }
                    }
                
                    for i = 0 to 1 do {
                        for j = 0 to 1 do {
                            write(res[i,j])
                        }
                    }
                
                }

                PROGRAM_END
        """
        programs.append(multiplyMat)
        
    
        }
    
}


